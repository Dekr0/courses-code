package com.example.assignmentzero;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;


public class MainActivity extends AppCompatActivity implements OnClickListener {

    public static final String EXTRA_MESSAGE = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main); // Not necessary

        final Button sendButton = findViewById(R.id.button);
        sendButton.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.button: {
                // Provides runtime binding between separate components (e.g, two activities)
                // Represents an app's intent to do something
                Intent intent = new Intent(this, DisplayMessageActivity.class);

                /*
                    Intent(
                        Context -> this Activity; also Activity class is a subclass of Context
                        Class ->
                    )
                 */

                EditText editText = (EditText) findViewById(R.id.editText);
                String message = editText.getText().toString();

                intent.putExtra(EXTRA_MESSAGE, message);

                startActivity(intent);

                break;
            }
        }
    }
}
