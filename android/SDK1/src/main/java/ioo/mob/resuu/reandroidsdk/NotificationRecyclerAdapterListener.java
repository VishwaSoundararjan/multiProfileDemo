package ioo.mob.resuu.reandroidsdk;

/**
 * Created by buvaneswaran on 3/8/2017.
 */

public interface NotificationRecyclerAdapterListener {

    void onClickDelete(RNotification notificationDetails, int position);

    void onClick(RNotification notificationDetails, int position);

}