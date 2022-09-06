package com.example.lonelytwitter;

import java.util.Date;


public abstract class Tweet implements Tweetable {

    protected Date date;
    protected String message;

    protected Tweet(String message) {
        date = new Date();
        this.message = message;
    }

    protected Tweet(Date date, String message) {
        this.date = date;
        this.message = message;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public abstract Boolean isImportant();
}


//public class Tweet {
//    private Date date;
//    private String message;
//
//    public Tweet(String message) {
//        this.message = message;
//        this.date = new Date();
//    }
//
//    public Tweet(Date date, String message) {
//        this.date = date;
//        this.message = message;
//    }
//
//    public Date getDate() {
//        return date;
//    }
//
//    public String getMessage() {
//        return message;
//    }
//
//    public void setDate(Date date) {
//        this.date = date;
//    }
//
//    public void setMessage(String message) {
//        this.message = message;
//    }
//
//    @Override
//    public String toString() {
//        return "Tweet:\n" +
//                "Date: " + date.toString() + "\n" +
//                "Message: " + message;
//    }
//}
