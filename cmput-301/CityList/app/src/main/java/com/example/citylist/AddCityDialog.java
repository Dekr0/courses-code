package com.example.citylist;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
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

    AddCityDialogListener listener;

    EditText editText;

    ArrayList<String> cityList;

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);

        try {
            listener = (AddCityDialogListener) context;
        } catch (ClassCastException e) {
            throw new ClassCastException("Must implement AddCityDialogListener");
        }
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

        LayoutInflater inflater = requireActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.add_city_dialog, null);
        editText = view.findViewById(R.id.edit_city_text);

        builder.setView(view)
                .setPositiveButton(R.string.add, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                listener.onDialogAddClick(editText.getText().toString());
                            }
                        });

        return builder.create();
    }
}
