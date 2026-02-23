package com.example.mobiledev.workshop3_2;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.GridView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.mobiledev.R;

public class GridActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_w3_grid);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        GridView gridView = findViewById(R.id.grid_view);
        
        String[] countries = {"Morocco", "Algeria", "Tunisia", "Egypt", "Libya", "Sudan", 
                              "Senegal", "Mali", "Burkina Faso", "Ivory Coast", "Ghana", "Nigeria",
                              "Cameroon", "Congo", "Kenya", "Uganda", "Tanzania", "Ethiopia",
                              "South Africa", "Zimbabwe", "Botswana", "Namibia", "Angola", "Zambia",
                              "Malawi", "Mozambique", "Madagascar", "Mauritius", "Seychelles", "Comoros",
                              "Djibouti", "Somalia", "Rwanda", "Burundi", "Sierra Leone", "Liberia",
                              "Guinea", "Gambia", "Cape Verde", "Sao Tome", "Equatorial Guinea", "Gabon"};
        
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, countries);
        gridView.setAdapter(adapter);
    }
}
