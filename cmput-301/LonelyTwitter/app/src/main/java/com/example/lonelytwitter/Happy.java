package com.example.lonelytwitter;

import androidx.annotation.NonNull;
import java.util.Date;


public class Happy extends Mood {

    private static final String HAPPY_MOOD = "Happy";

    public Happy() {
        super();
    }

    public Happy(Date date) {
        super(date);
    }

    @NonNull
    @Override
    public String toString() {
        return HAPPY_MOOD;
    }
}
