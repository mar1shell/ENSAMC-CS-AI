# Exercise 1 — Gestion Des Etudiants (SQLite)

Flutter app for CRUD management of students using a local SQLite database.

## What it does

- Creates a local database with table students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)
- Adds students via a TextField + button Ajouter
- Displays all students in a ListView
- Updates a student name via dialog + button edit
- Deletes a student via button delete

## Flutter concepts covered

| Concept                 | Where                                           |
| ----------------------- | ----------------------------------------------- |
| `sqflite`               | Local SQLite storage and SQL table creation     |
| `StatefulWidget`        | Manages input, async reload, and UI refresh     |
| `FutureBuilder`         | Renders asynchronous student list from database |
| `TextEditingController` | Handles add/edit form input                     |
| CRUD logic              | insert, select, update, delete operations       |

## Running

```bash
flutter pub get
flutter run
```

## Project structure

```
ex1_students_db/
├── lib/
│   └── main.dart   # Database helper + students CRUD UI
├── test/
│   └── widget_test.dart
└── pubspec.yaml
```
