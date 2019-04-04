package com.uofc.cpsc.ezar;

import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;

import com.uofc.cpsc.ezar.plugin.JumpToAR;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.PluginRegistry;


public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        registerCustomPlugin(this);

    }

    private static void registerCustomPlugin(PluginRegistry registrar) {

        JumpToAR.registerWith(registrar.registrarFor(JumpToAR.CHANNEL));


    }

}
