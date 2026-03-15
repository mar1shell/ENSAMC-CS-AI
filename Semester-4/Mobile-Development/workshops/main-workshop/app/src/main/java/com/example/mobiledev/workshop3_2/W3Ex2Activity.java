package com.example.mobiledev.workshop3_2;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.mobiledev.R;

public class W3Ex2Activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_w3_ex2);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        Button btnList = findViewById(R.id.btn_list);
        Button btnGrid = findViewById(R.id.btn_grid);
        Button btnSpinner = findViewById(R.id.btn_spinner);

        btnList.setOnClickListener(v -> {
            Intent intent = new Intent(W3Ex2Activity.this, ListActivity.class);
            startActivity(intent);
        });

        btnGrid.setOnClickListener(v -> {
            Intent intent = new Intent(W3Ex2Activity.this, GridActivity.class);
            startActivity(intent);
        });

        btnSpinner.setOnClickListener(v -> {
            Intent intent = new Intent(W3Ex2Activity.this, SpinnerActivity.class);
            startActivity(intent);
        });
    }
}