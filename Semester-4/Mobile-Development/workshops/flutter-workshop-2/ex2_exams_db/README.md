# Exercise 2 — Gestion Des Examens (SQLite CRUD)

Flutter app for CRUD management of exams using a local SQLite database.

## What it does

- Creates a local table exams(id INTEGER PRIMARY KEY AUTOINCREMENT, exam_name TEXT)
- Adds exams with TextField + button Ajouter
- Displays all exams in a ListView
- Updates an exam name via dialog + button edit
- Deletes an exam via button delete

## Flutter concepts covered

| Concept                 | Where                                             |
| ----------------------- | ------------------------------------------------- |
| `sqflite`               | Local SQLite storage and SQL table creation       |
| `StatefulWidget`        | Manages input, async list loading, and UI refresh |
| `FutureBuilder`         | Displays async results from database queries      |
| `TextEditingController` | Handles add/edit form fields                      |
| CRUD logic              | insert, select, update, delete operations         |

## Running

```bash
flutter pub get
flutter run
```

## Project structure

```
ex2_exams_db/
├── lib/
│   └── main.dart   # Database helper + exams CRUD UI
├── test/
│   └── widget_test.dart
└── pubspec.yaml
```
