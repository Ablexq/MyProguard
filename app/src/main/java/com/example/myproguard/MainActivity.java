package com.example.myproguard;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        System.out.println("=========111");
        Log.e("main", "===========a");
        Log.i("main", "==========b");
        Log.w("main", "=========c");
        Log.v("main", "==========d");
        Log.d("main", "==========e");
        System.err.println("==========222");
    }
}
