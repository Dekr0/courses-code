package com.example.lonelytwitter;

import java.util.Date;


public abstract class Mood {

    protected Date date;

    public Mood() {
        date = new Date();
    }

    public Mood(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
