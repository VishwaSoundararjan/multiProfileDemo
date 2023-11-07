package ioo.mob.resuu.reandroidsdk;

import android.view.MotionEvent;
import android.view.View;

import ioo.mob.resuu.reandroidsdk.error.Log;


public class EventSenseListener implements View.OnTouchListener {


    @Override
    public boolean onTouch(View v, MotionEvent event) {
        try {
            Log.e("sendAccessibilityEvent", "happened");
            AppLifecyclePresenter.getInstance().fieldWiseDataListener(v);
            return false;
        } catch (Exception e) {
            return false;
        }

    }

}
