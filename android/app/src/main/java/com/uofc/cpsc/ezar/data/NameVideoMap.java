package com.uofc.cpsc.ezar.data;

import android.util.Log;

import java.util.HashMap;
import java.util.Map;


public class NameVideoMap {
    public Map<String, Video> map = new HashMap<>();


    public Video getVideoByName(String name) {
        return map.get(name);
    }

    public void putVideo(String name, Video video) {
        map.put(name, video);
    }

}
