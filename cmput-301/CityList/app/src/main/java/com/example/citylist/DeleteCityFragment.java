package com.example.citylist;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

import java.util.ArrayList;

public class DeleteCityFragment extends DialogFragment {

    Spinner spinner;

    ArrayAdapter<String> adapter;
    DialogListener listener;

    ArrayList<String> cityList;

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);

        try {
            listener = (DialogListener) context;
        } catch (ClassCastException e) {
            throw new ClassCastException("Must implement DialogListener");
        }
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
        cityList = requireArguments().getStringArrayList("cityList");

        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

        LayoutInflater inflater = requireActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.delete_city_dialog, null);
        spinner = view.findViewById(R.id.spinner);

        adapter = new ArrayAdapter<>(getActivity(),
                android.R.layout.simple_spinner_dropdown_item, cityList);

        spinner.setAdapter(adapter);

        builder.setView(view)
                .setPositiveButton("Delete", (dialogInterface, i)
                        -> {
                    if (!cityList.isEmpty()) {
                        cityList.remove(spinner.getSelectedItem().toString());
                    }
                    listener.onDialogConfirmClick(true);
                });

        return builder.create();
    }
}
