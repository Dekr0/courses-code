package com.example.lonelytwitter;

import androidx.annotation.NonNull;
import java.util.Date;


public class Happy extends Mood {

    public Happy() {
        super();
    }

    public Happy(Date date) {
        super(date);
    }

    @NonNull
    @Override
    public String toString() {
        return "Happy";
    }
}
