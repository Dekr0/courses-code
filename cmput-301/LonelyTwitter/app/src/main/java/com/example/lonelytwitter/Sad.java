package com.example.lonelytwitter;

import androidx.annotation.NonNull;
import java.util.Date;

public class Sad extends Mood {

    private static final String SAD_MOOD = "Sad";

    public Sad() {
        super();
    }

    public Sad(Date date) {
        super(date);
    }

    @NonNull
    @Override
    public String toString() {
        return SAD_MOOD;
    }
}

