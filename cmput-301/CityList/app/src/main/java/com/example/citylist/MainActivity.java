package com.example.citylist;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity
        implements DialogListener, AdapterView.OnItemClickListener,
        View.OnClickListener {

    private Button addCityButton;
    private Button deleteCityButton;

    ArrayAdapter<City> adapter;

    ArrayList<City> cities;

    @Override
    public void onAddCityDialogConfirmClick(String cityName, String province) {
        for (City city :
                cities) {
            if (cityName.equals(city.getCity())) {
                return;
            }
        }

        cities.add(new City(cityName, province));

        adapter.notifyDataSetChanged();
    }

    @Override
    public void onClick(View view) {
        Bundle bundle = new Bundle();

        if (view.getId() == addCityButton.getId()) {
            getSupportFragmentManager().beginTransaction()
                    .setReorderingAllowed(true)
                    .add(AddEditCityDialog.class, bundle, AddEditCityDialog.ADD_TAG)
                    .commit();
        } else if (view.getId() == deleteCityButton.getId()) {
            ArrayList<String> cityNames = new ArrayList<>();
            for (City city :
                    cities) {
                cityNames.add(city.getCity());
            }

            bundle.putStringArrayList("cityNames", cityNames);
            getSupportFragmentManager().beginTransaction()
                    .setReorderingAllowed(true)
                    .add(DeleteCityFragment.class, bundle, "delete_city_dialog")
                    .commit();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        addCityButton = findViewById(R.id.add_city_button);
        deleteCityButton = findViewById(R.id.delete_city_button);
        ListView listView = findViewById(R.id.city_list_view);

        String[] cities = {"Edmonton", "Vancouver", "Calgary", "Toronto", "Waterloo", "Kingston"};
        String[] provinces = {"AB", "BC", "AB", "ON", "ON", "ON"};

        this.cities = new ArrayList<>();
        for (int i = 0; i < cities.length; i++) {
            this.cities.add(new City(cities[i], provinces[i]));
        }

        adapter = new CityArrayAdapter(this, this.cities);

        addCityButton.setOnClickListener(this);
        deleteCityButton.setOnClickListener(this);

        listView.setAdapter(adapter);
        listView.setOnItemClickListener(this);
    }

    @Override
    public void onDeleteDialogConfirmClick(int position) {
        cities.remove(position);

        adapter.notifyDataSetChanged();
    }

    @Override
    public void onEditCityDialogConfirmClick(String oldCity, String newCity,
                                             String province) {
        for (City city :
                cities) {
            if (oldCity.equals(city.getCity())) {
                city.setCity(newCity);
                city.setProvince(province);

                adapter.notifyDataSetChanged();

                return;
            }
        }
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        Bundle bundle = new Bundle();

        bundle.putString("city", cities.get(i).getCity());
        bundle.putString("province", cities.get(i).getProvince());

        getSupportFragmentManager().beginTransaction()
                .setReorderingAllowed(true)
                .add(AddEditCityDialog.class, bundle, AddEditCityDialog.EDIT_TAG)
                .commit();
    }
}