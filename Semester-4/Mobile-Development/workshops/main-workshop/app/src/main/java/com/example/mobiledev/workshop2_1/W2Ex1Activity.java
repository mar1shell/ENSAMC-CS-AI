package com.example.mobiledev.workshop2_1;

import android.content.Intent;
import android.os.Bundle;
import android.widget.GridView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.mobiledev.R;

public class W2Ex1Activity extends AppCompatActivity {

    // Parallel arrays: image, name, description, sound resource id
    static final int[] ANIMAL_IMAGES = {
            R.drawable.i1, R.drawable.i2, R.drawable.i3,
            R.drawable.i4, R.drawable.i5, R.drawable.i6,
            R.drawable.i7, R.drawable.i8, R.drawable.i9
    };

    static final String[] ANIMAL_NAMES = {
            "Animal 1", "Animal 2", "Animal 3",
            "Animal 4", "Animal 5", "Animal 6",
            "Animal 7", "Animal 8", "Animal 9"
    };

    static final String[] ANIMAL_DESCRIPTIONS = {
            "This is animal 1. A fascinating creature found in the wild.",
            "This is animal 2. Known for its unique characteristics.",
            "This is animal 3. A wonderful example of nature's diversity.",
            "This is animal 4. Often found in tropical environments.",
            "This is animal 5. A social animal living in groups.",
            "This is animal 6. Famous for its distinctive appearance.",
            "This is animal 7. An agile and graceful animal.",
            "This is animal 8. Known for its intelligence and adaptability.",
            "This is animal 9. A rare species found across multiple continents."
    };

    static final int[] ANIMAL_SOUNDS = {
            R.raw.a1, R.raw.a2, R.raw.a3,
            R.raw.a4, R.raw.a5, R.raw.a6,
            R.raw.a7, R.raw.a8, R.raw.a9
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_w2_ex1);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        GridView gridView = findViewById(R.id.animal_grid);
        AnimalGridAdapter adapter = new AnimalGridAdapter(this, ANIMAL_IMAGES, ANIMAL_NAMES);
        gridView.setAdapter(adapter);

        gridView.setOnItemClickListener((parent, view, position, id) -> {
            Intent intent = new Intent(W2Ex1Activity.this, AnimalDetailActivity.class);
            intent.putExtra("position", position);
            startActivity(intent);
        });
    }
}
