package ioo.mob.resuu.reandroidsdk;

import static ioo.mob.resuu.reandroidsdk.AppConstants.NOTIFICATION_RECEIVED_AMP;
import static ioo.mob.resuu.reandroidsdk.AppConstants.NOTIFICATION_RECEIVED_FCM;
import static ioo.mob.resuu.reandroidsdk.Util.getLauncherActivityName;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;

import androidx.core.app.NotificationManagerCompat;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import ioo.mob.resuu.reandroidsdk.error.ExceptionTracker;
import ioo.mob.resuu.reandroidsdk.error.Log;


class NotificationHelper {

    private static Context appContext;

    NotificationHelper(Context context) {
        appContext = context;
    }

    private Intent getIntent(Map<String, String> map) {
        Intent intent = new Intent();
        try {
            JSONObject jsonObject = new JSONObject();
            try {
                intent = new Intent(appContext, Class.forName(map.get("navigationScreen").trim()));
            } catch (Exception e) {
                intent = new Intent(appContext, Class.forName(getLauncherActivityName(appContext)));
            }

            for (String value : map.keySet()) {
                intent.putExtra(value, map.get(value));
                jsonObject.put(value, map.get(value));
            }
            Log.e("Push Notification", "" + jsonObject.toString());
            intent.putExtra("activityName", map.get("navigationScreen"));
            intent.putExtra("fragmentName", map.get("category"));
            intent.putExtra("notificationId", map.get("id").hashCode());
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            return intent;
        } catch (Exception e) {
            ExceptionTracker.track(e);
        }
        return intent;

    }

    private Intent getIntent(Bundle map) {
        Intent intent = new Intent();
        try {
            try {
                intent = new Intent(appContext, Class.forName(map.getString("navigationScreen").trim()));
            } catch (Exception e) {
                intent = new Intent(appContext, Class.forName(getLauncherActivityName(appContext)));
            }
            Object[] parameters = map.keySet().toArray();
            JSONObject jsonObject = new JSONObject();
            for (Object o : parameters) {
                String key = "" + o;
                String value = "" + map.get(key);
                //Log.e("key", "" + o);
                // Log.e("values", "" + map.get(key));
                intent.putExtra(key, value);
                jsonObject.put(key, value);
            }
            Log.e("Push Notification", "" + jsonObject.toString());
            intent.putExtra("notificationId", map.getString("id").hashCode());
            intent.putExtra("activityName", map.getString("navigationScreen"));
            intent.putExtra("fragmentName", map.getString("category"));
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            return intent;
        } catch (Exception e) {
            ExceptionTracker.track(e);
        }
        return intent;

    }

    void handleDataMessage(Bundle map) {
        try {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            Handler handler = new Handler(Looper.getMainLooper());
            executor.execute(() -> {
                try {


                    Intent intent = getIntent(map);
                    //Background work here
                    //UI Thread work here
                    handler.post(() -> {
                        //UI Thread work here
                        try {
                            if (map.containsKey("isCarousel")) {
                                if (Boolean.parseBoolean(map.getString("isCarousel"))) {
                                    if (map.containsKey("carousel")) {
                                        addNotification(intent);
                                        presentNotification(intent);
                                    } else {
                                        try {
                                            JSONObject jsonObject = new JSONObject();
                                            jsonObject.put("url", AppConstants.CarosualUrl + "=" + map.getString("id"));
                                            new DataNetworkHandler().apiCallGetCarouselNotification(appContext, jsonObject);
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }

                                    }
                                } else {
                                    addNotification(intent);
                                    presentNotification(intent);
                                }
                            } else {
                                addNotification(intent);
                                presentNotification(intent);
                            }
                        } catch (Exception e) {

                        }
                    });
                } catch (Exception e) {

                }
            });

        } catch (Exception e) {
            ExceptionTracker.track(e);
        }

    }

    void handleDataMessage(Map<String, String> map) {
        try {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            Handler handler = new Handler(Looper.getMainLooper());
            executor.execute(() -> {
                try {
                    Intent intent = getIntent(map);
                    //Background work here
                    //UI Thread work here
                    handler.post(() -> {
                        //UI Thread work here
                        try {
                            if (map.containsKey("isCarousel")) {
                                if (Boolean.parseBoolean(map.get("isCarousel"))) {
                                    if (map.containsKey("carousel")) {
                                        addNotification(intent);
                                        presentNotification(intent);
                                    } else {
                                        try {
                                            JSONObject jsonObject = new JSONObject();
                                            jsonObject.put("url", AppConstants.CarosualUrl + "=" + map.get("id"));
                                            new DataNetworkHandler().apiCallGetCarouselNotification(appContext, jsonObject);
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }

                                    }
                                } else {
                                    addNotification(intent);
                                    presentNotification(intent);
                                }
                            } else {
                                addNotification(intent);
                                presentNotification(intent);
                            }
                        } catch (Exception e) {

                        }
                    });
                } catch (Exception e) {

                }
            });

        } catch (Exception e) {
            ExceptionTracker.track(e);
        }

    }

    private void presentNotification(Intent intent) {

        try {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            Handler handler = new Handler(Looper.getMainLooper());
            executor.execute(() -> {

                boolean isAppInBackground = false;
                try {
                    isAppInBackground = Util.isAppIsInBackground(appContext);

                    //Background work here
                    //UI Thread work here
                    boolean finalIsAppInBackground = isAppInBackground;
                    handler.post(() -> {
                        //UI Thread work here
                        try {
                            Bundle map = intent.getExtras();
                            String pushType = map.getString("pushType");
                            String url = "";
                            if (map.containsKey("url"))
                                url = map.getString("url").trim();
                            assert pushType != null;
                            if (NotificationManagerCompat.from(appContext).areNotificationsEnabled()) {

                                if (pushType.equalsIgnoreCase("2")) {
                                    // In-app
                                    if (finalIsAppInBackground) {
                                        if (!TextUtils.isEmpty(url) && map.getString("sourceType").equalsIgnoreCase("4"))
                                            new PictureStyleNotification(appContext, intent);
                                        else {
                                            new AppNotification().showNotification(appContext, intent, null);
                                        }
                                    } else {
                                        new AppWidgets().showBannerDialog(ReAndroidSDK.activityLifecycleCallbacks.mActivity, intent);
                                    }
                                } else if (pushType.equalsIgnoreCase("1")) {
                                    if (intent.getExtras().containsKey("carousel")) {
                                        JSONArray jsonArray = new JSONArray(intent.getStringExtra("carousel"));
                                        String imageUrl = jsonArray.getJSONObject(0).optString("url");
                                        if (TextUtils.isEmpty(imageUrl)) {
                                            new AppNotification().carouselNotification(appContext, intent, 0, null);
                                        } else {
                                            new PictureStyleNotification(appContext, intent, imageUrl, 0);
                                        }
                                    } else if (!TextUtils.isEmpty(url) && map.getString("sourceType").equalsIgnoreCase("4")) {
                                        new PictureStyleNotification(appContext, intent);
                                    } else {
                                        new AppNotification().showNotification(appContext, intent, null);
                                    }

                                }
                            } else {
                                if (!finalIsAppInBackground && NotificationManagerCompat.from(appContext).areNotificationsEnabled() || AppConstants.NOTIFICATION_DND_DISABLED) {
                                    new AppWidgets().showBannerDialog(ActivityLifecycleCallbacks.mActivity, intent);
                                } else {
                                    Log.e("User Disabled", "Notifications");
                                }
                            }
                        } catch (Exception e) {

                        }
                    });
                } catch (Exception e) {

                }
            });


        } catch (Exception es) {
            es.printStackTrace();
        }
    }

    private void addNotification(Intent intent) {
        try {

            ExecutorService executor = Executors.newSingleThreadExecutor();
            Handler handler = new Handler(Looper.getMainLooper());
            executor.execute(() -> {
                //Background work here
                try {
                    Bundle map = intent.getExtras();
                    JSONObject jsonObject = new JSONObject();
                    String id = getValue(map, "id");
                    try {
                        Set<String> stringSet = map.keySet();
                        jsonObject.put("timeStamp", Util.getCurrentLocal());
                        jsonObject.put("campaignId", id);
                        jsonObject.put("isRead", false);
                        for (String s : stringSet) {
                            jsonObject.put(s, map.get(s));
                        }
                    } catch (Exception e) {

                    }
                    //UI Thread work here
                    handler.post(() -> {
                        //UI Thread work here
                        try {
                            if (NotificationManagerCompat.from(appContext).areNotificationsEnabled() || AppConstants.NOTIFICATION_DND_DISABLED) {
                                new DBTask(jsonObject, id, false).execute();
                            }
                        } catch (Exception e) {

                        }
                        try {
                            if (map.containsKey("isAMP")) {
                                boolean isEnd = Boolean.parseBoolean(map.getString("isEND"));
                                new OfflineCampaignTrack(appContext, id, NOTIFICATION_RECEIVED_AMP, true, isEnd, DataNetworkHandler.getInstance()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, "");
                            } else {
                                new OfflineCampaignTrack(appContext, id, NOTIFICATION_RECEIVED_FCM, "Notification received", false, null, null, DataNetworkHandler.getInstance()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, "");
                            }
                        } catch (Exception ignored) {
                            ignored.printStackTrace();
                        }
                    });
                } catch (Exception e) {

                }
            });
        } catch (Exception e) {
            ExceptionTracker.track(e);
        }
    }

    private String getValue(Bundle map, String key) {
        try {
            if (map.containsKey(key)) {
                return map.getString(key);
            } else {
                return "";
            }
        } catch (Exception e) {
            return "";
        }
    }

    private class DBTask /*extends AsyncTask<String, String, String>*/ {
        JSONObject jsonObject;
        String id;
        boolean flag;

        DBTask(JSONObject jsonObject, String id, boolean flag) {
            this.jsonObject = jsonObject;
            this.id = id;
            this.flag = flag;
        }


        void execute() {
            try {
                ExecutorService executor = Executors.newSingleThreadExecutor();
                executor.execute(() -> {
                    try {
                        String s = doInBackground();
                    } catch (Exception e) {

                    }

                });
            } catch (Exception e) {

            }
        }

        private String doInBackground(String... urls) {
            try {
                ArrayList<RNotification> arrayList = new DataBase(appContext).getDataByModel(DataBase.Table.NOTIFICATION_TABLE);
                if (arrayList != null && arrayList.size() > 15) {
                    new DataBase(appContext).deleteNotificationData(arrayList.get(0), DataBase.Table.NOTIFICATION_TABLE);
                }
                new DataBase(appContext).insertOrUpdateNData(jsonObject.toString(), id, flag, DataBase.Table.NOTIFICATION_TABLE);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "";
        }
    }

}
