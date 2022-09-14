package com.example.fragmenttutorial;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;



public class MainActivity extends AppCompatActivity {

    // When the activity's layout is inflated, the specified fragment is
    // instantiated,
    // **onInflate()** is called on the newly instantiated fragment,
    // and a **FragmentTransaction** is created to add the fragment
    // ot the **FragmentManger**

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}