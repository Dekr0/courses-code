package com.example.citylist;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.os.Parcelable;
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

public class AddEditCityDialog extends DialogFragment {

    final static public String ADD_TAG = "Add";
    final static public String EDIT_TAG = "Edit";

    EditText editCity;
    EditText editProvince;

    DialogListener listener;

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
        Bundle bundle = requireArguments();
        String tag = getTag();

        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

        LayoutInflater inflater = requireActivity().getLayoutInflater();

        View view = inflater.inflate(R.layout.add_city_dialog, null);
        editCity = view.findViewById(R.id.edit_city);
        editProvince = view.findViewById(R.id.edit_province);

        if (tag != null && tag.equals(EDIT_TAG)) {
            editCity.setText(bundle.getString("city"));
            editProvince.setText(bundle.getString("province"));
        }

        builder.setView(view)
                .setPositiveButton(tag, (dialogInterface, i) -> {
                    if (tag != null) {

                        String city = editCity.getText().toString();
                        String province = editProvince.getText().toString();

                        if (tag.equals(EDIT_TAG)) {
                            listener.onEditCityDialogConfirmClick(
                                    bundle.getString("city"), city, province);
                        } else if (tag.equals(ADD_TAG)) {
                            listener.onAddCityDialogConfirmClick(city, province);
                        }
                    }
                });


        return builder.create();
    }
}
