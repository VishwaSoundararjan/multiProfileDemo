package ioo.mob.resuu.reandroidsdk;

import org.json.JSONObject;

public interface Journey {

    void onJourneyData(JSONObject data, String actionName);
}
