package com.example.mobiledev.workshop2_1;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.mobiledev.R;

public class AnimalDetailActivity extends AppCompatActivity {

    private MediaPlayer mediaPlayer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_animal_detail);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        int position = getIntent().getIntExtra("position", 0);

        ImageView animalImage = findViewById(R.id.detail_image);
        TextView animalName = findViewById(R.id.detail_name);
        TextView animalDescription = findViewById(R.id.detail_description);
        Button btnPlaySound = findViewById(R.id.btn_play_sound);

        animalImage.setImageResource(W2Ex1Activity.ANIMAL_IMAGES[position]);
        animalName.setText(W2Ex1Activity.ANIMAL_NAMES[position]);
        animalDescription.setText(W2Ex1Activity.ANIMAL_DESCRIPTIONS[position]);

        int soundResId = W2Ex1Activity.ANIMAL_SOUNDS[position];

        btnPlaySound.setOnClickListener(v -> {
            if (mediaPlayer != null) {
                mediaPlayer.release();
            }
            mediaPlayer = MediaPlayer.create(getApplicationContext(), soundResId);
            mediaPlayer.start();
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (mediaPlayer != null) {
            mediaPlayer.release();
            mediaPlayer = null;
        }
    }
}
