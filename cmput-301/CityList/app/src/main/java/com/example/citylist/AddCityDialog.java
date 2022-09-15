package com.example.citylist;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;

import java.util.ArrayList;


/**
 * References:
 * https://developer.android.com/develop/ui/views/components/dialogs#CustomLayout
 * https://developer.android.com/develop/ui/views/components/dialogs#PassingEvents
 */

public class AddCityDialog extends DialogFragment {

    EditText editText;

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
        View view = inflater.inflate(R.layout.add_city_dialog, null);
        editText = view.findViewById(R.id.edit_city_text);

        builder.setView(view)
                .setPositiveButton(R.string.add, (dialogInterface, i)
                        -> {
                    String cityName = editText.getText().toString();
                    boolean hasCity = !cityList.contains(cityName);

                    if (hasCity) {
                        cityList.add(cityName);
                    }

                    listener.onDialogConfirmClick(hasCity);
                });

        return builder.create();
    }
}
