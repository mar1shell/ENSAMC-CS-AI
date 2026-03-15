package com.example.mobiledev;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.mobiledev.workshop2_1.W2Ex1Activity;
import com.example.mobiledev.workshop3_1.W3Ex1Activity;
import com.example.mobiledev.workshop3_2.W3Ex2Activity;
import com.example.mobiledev.workshop3_2.ListActivity;
import com.example.mobiledev.workshop3_2.GridActivity;
import com.example.mobiledev.workshop3_2.SpinnerActivity;

public class MainActivity extends AppCompatActivity {

    // TODO: Add your new workshops and exercises here!
    private static final Workshop[] WORKSHOPS = {
            new Workshop("Workshop 2: Multimedia Resources", new Exercise[]{
                    new Exercise("Exercise 1: Animal Gallery", W2Ex1Activity.class)
            }),
            new Workshop("Workshop 3: Lists, Grid & Spinner", new Exercise[]{
                    new Exercise("Exercise 1: Test Activity", W3Ex1Activity.class),
                    new Exercise("Exercise 2: les listes simples", W3Ex2Activity.class),
            }),
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        ExpandableListView listView = findViewById(R.id.workshop_list);
        listView.setAdapter(new WorkshopAdapter());

        listView.setOnChildClickListener((parent, v, groupPosition, childPosition, id) -> {
            Exercise selectedExercise = WORKSHOPS[groupPosition].exercises[childPosition];
            Intent intent = new Intent(MainActivity.this, selectedExercise.activityClass);
            startActivity(intent);
            return true;
        });
    }

    private static class Workshop {
        String name;
        Exercise[] exercises;

        Workshop(String name, Exercise[] exercises) {
            this.name = name;
            this.exercises = exercises;
        }
    }

    private static class Exercise {
        String name;
        Class<?> activityClass;

        Exercise(String name, Class<?> activityClass) {
            this.name = name;
            this.activityClass = activityClass;
        }
    }

    private class WorkshopAdapter extends BaseExpandableListAdapter {
        @Override
        public int getGroupCount() { return WORKSHOPS.length; }

        @Override
        public int getChildrenCount(int groupPosition) { return WORKSHOPS[groupPosition].exercises.length; }

        @Override
        public Object getGroup(int groupPosition) { return WORKSHOPS[groupPosition]; }

        @Override
        public Object getChild(int groupPosition, int childPosition) { return WORKSHOPS[groupPosition].exercises[childPosition]; }

        @Override
        public long getGroupId(int groupPosition) { return groupPosition; }

        @Override
        public long getChildId(int groupPosition, int childPosition) { return childPosition; }

        @Override
        public boolean hasStableIds() { return true; }

        @Override
        public View getGroupView(int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = getLayoutInflater().inflate(android.R.layout.simple_expandable_list_item_1, parent, false);
            }
            TextView textView = convertView.findViewById(android.R.id.text1);
            textView.setText(WORKSHOPS[groupPosition].name);
            return convertView;
        }

        @Override
        public View getChildView(int groupPosition, int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = getLayoutInflater().inflate(android.R.layout.simple_list_item_1, parent, false);
            }
            TextView textView = convertView.findViewById(android.R.id.text1);
            textView.setText(WORKSHOPS[groupPosition].exercises[childPosition].name);
            textView.setPadding(100, textView.getPaddingTop(), textView.getPaddingRight(), textView.getPaddingBottom());
            return convertView;
        }

        @Override
        public boolean isChildSelectable(int groupPosition, int childPosition) { return true; }
    }
}