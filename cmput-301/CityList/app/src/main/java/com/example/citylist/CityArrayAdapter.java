package com.example.citylist;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentManager;

import java.util.ArrayList;


public class CityArrayAdapter extends ArrayAdapter<City> {
    final private Context context;
    final private ArrayList<City> cities;

    public CityArrayAdapter(Context context, ArrayList<City> cityArrayList) {
        super(context, 0, cityArrayList);
        this.cities = cityArrayList;
        this.context = context;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView,
                        @NonNull ViewGroup parent) {
        if (convertView == null) {
            convertView = LayoutInflater.from(context).inflate(R.layout.city_entry,
                    parent, false);
        }

        City city = cities.get(position);

        TextView cityView = convertView.findViewById(R.id.city_view);
        TextView provinceView = convertView.findViewById(R.id.province_view);

        cityView.setText(city.getCity());
        provinceView.setText(city.getProvince());

        return convertView;
    }
}
