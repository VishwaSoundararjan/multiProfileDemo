package ioo.mob.resuu.reandroidsdk;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import java.util.ArrayList;

import io.mob.resu.reandroidsdk.R;


public class ReNotificationAdapter extends ReBaseRecyclerAdapter<RNotification, ReNotificationViewHolder> {

    // Caution: we are not supposed to bring context inside the adapter at any cause;
    public NotificationRecyclerAdapterListener listener;

    public ReNotificationAdapter(ArrayList<RNotification> data, NotificationRecyclerAdapterListener listener) {
        super(data);
        this.listener = listener;
    }

    @Override
    public ReNotificationViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return new ReNotificationViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.re_inflate_notification_item, parent, false), listener);
    }
}
