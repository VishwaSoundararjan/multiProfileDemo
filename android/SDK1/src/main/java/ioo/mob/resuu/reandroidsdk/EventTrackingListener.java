package ioo.mob.resuu.reandroidsdk;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

import ioo.mob.resuu.reandroidsdk.error.Log;

public class EventTrackingListener extends View.AccessibilityDelegate {

    @Override
    public void sendAccessibilityEvent(View host, int eventType) {
        super.sendAccessibilityEvent(host, eventType);
        try {
            Log.e("sendAccessibilityEvent", "" + eventType);
            AppLifecyclePresenter.getInstance().fieldWiseDataListener(host);
        } catch (Exception e) {

        }

    }

    @Override
    public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(host, info);
        // Log.e("onInitializeAccessibilityNodeInfo", "Called" );
    }


}
