package com.uofc.cpsc.ezar.data;

public class Video {

    public String Vlink;
    public int Vtype;


    public Video(String link, int type) {
        Vlink = link;
        Vtype = type;
    }

    public int getType() {
        return Vtype;
    }

    public String getLink() {
        return Vlink;
    }
}
