package com.example.lonelytwitter;


import java.util.Date;

public class NormalTweet extends Tweet {

    public NormalTweet(String message) {
        super(message);
    }

    public NormalTweet(Date date, String message) {
        super(date, message);
    }

    @Override
    public Date getDate() {
        return date;
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public Boolean isImportant() {
        return Boolean.FALSE;
    }

    @Override
    public String toString() {
        return "Date: " + date.toString() + " Tweet message: " + message;
    }
}
