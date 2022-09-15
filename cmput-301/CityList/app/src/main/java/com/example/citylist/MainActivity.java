package com.example.citylist;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Objects;

public class MainActivity extends AppCompatActivity
        implements DialogListener, View.OnClickListener {

    Button addCityButton;
    Button deleteCityButton;
    ListView cityListView;

    ArrayAdapter<String> adapter;

    ArrayList<String> cityList;

    @Override
    public void onClick(View view) {
        Bundle citiesBundle = new Bundle();
        citiesBundle.putStringArrayList("cityList", cityList);

        if (view.getId() == addCityButton.getId()) {
            getSupportFragmentManager().beginTransaction()
                    .setReorderingAllowed(true)
                    .add(AddCityDialog.class, citiesBundle, "add_city_dialog")
                    .commit();
        } else if (view.getId() == deleteCityButton.getId()) {
            getSupportFragmentManager().beginTransaction()
                    .setReorderingAllowed(true)
                    .add(DeleteCityFragment.class, citiesBundle, "delete_city_dialog")
                    .commit();
        }
    }

    @Override
    public void onDialogConfirmClick(boolean status) {
        if (status) {
            adapter.notifyDataSetChanged();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        addCityButton = findViewById(R.id.add_city_button);
        deleteCityButton = findViewById(R.id.delete_city_button);
        cityListView = findViewById(R.id.city_list_view);

        String[] cities = {"Edmonton", "Vancouver"};

        cityList = new ArrayList<>();
        cityList.addAll(Arrays.asList(cities));

        adapter = new ArrayAdapter<>(getApplicationContext(),
                R.layout.list_text_view_template, cityList);

        cityListView.setAdapter(adapter);

        addCityButton.setOnClickListener(this);
        deleteCityButton.setOnClickListener(this);
    }
}