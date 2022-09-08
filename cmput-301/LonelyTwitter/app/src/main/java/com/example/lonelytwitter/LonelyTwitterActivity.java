package com.example.lonelytwitter;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.util.ArrayList;


public class LonelyTwitterActivity extends AppCompatActivity {

    private final ArrayList<Tweet> tweetList = new ArrayList<Tweet>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button sendTweetButton = (Button) findViewById(R.id.sendTweet);

        sendTweetButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (view.getId() == sendTweetButton.getId()) {
                    EditText tweetMsgField = (EditText) findViewById(R.id.editTweetMessage);

                    String message = tweetMsgField.getText().toString();
                    NormalTweet normalTweet = new NormalTweet(message);
                    tweetList.add(normalTweet);

                    System.out.println("\nTweet history: ");
                    for (Tweet tweet:
                         tweetList) {
                        System.out.println(tweet.toString());
                    }

                    tweetMsgField.setText("");
                }
            }
        });
    }
}
