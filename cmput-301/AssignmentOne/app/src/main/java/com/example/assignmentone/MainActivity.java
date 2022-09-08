package com.example.assignmentone;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.DialogFragment;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.Spinner;

import java.util.Calendar;


public class MainActivity extends AppCompatActivity {

    public static class DatePickerFragment extends DialogFragment
            implements DatePickerDialog.OnDateSetListener {

        @NonNull
        @Override
        public Dialog onCreateDialog(@Nullable Bundle savedInstanceState) {
            final Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int day = c.get(Calendar.DAY_OF_MONTH);

            DatePickerDialog datePickerDialog = new
                    DatePickerDialog(requireContext(), this, year, month, day);

            datePickerDialog.getDatePicker().setMinDate(c.getTimeInMillis());

            return datePickerDialog;
        }

        @Override
        public void onDateSet(DatePicker datePicker, int year, int month, int day) {

        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button selectDateButton = findViewById(R.id.selectDateButton);
        Spinner foodLocationSpinner = findViewById(R.id.foodLocationSpinner);

        selectDateButton.setOnClickListener(view -> {
            if (view.getId() == selectDateButton.getId()) {
                DialogFragment dialogFragment = new DatePickerFragment();
                dialogFragment.show(getSupportFragmentManager(), "datePicker");
            }
        });

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                this, R.array.location_name, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        foodLocationSpinner.setAdapter(adapter);
    }
}
