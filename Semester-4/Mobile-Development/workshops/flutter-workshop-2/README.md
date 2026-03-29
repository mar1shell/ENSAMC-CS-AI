# Flutter Workshop 2

SQLite CRUD exercises in Flutter based on the first workshop structure.

## Structure

```
flutter-workshop-2/
├── ex1_students_db/   # Gestion des etudiants (SQLite CRUD)
├── ex2_exams_db/      # Gestion des examens (SQLite CRUD)
└── Flutter3.pdf       # Workshop statement
```

## Exercises

| Exercise                              | Topic            | Description                        |
| ------------------------------------- | ---------------- | ---------------------------------- |
| [ex1_students_db](./ex1_students_db/) | SQLite + Flutter | Create/read/update/delete students |
| [ex2_exams_db](./ex2_exams_db/)       | SQLite + Flutter | Create/read/update/delete exams    |

## Requirements

- Flutter SDK >= 3.0.0
- Dart SDK ^3.11.1
- Android emulator / iOS simulator / physical device

## Running

Run each exercise independently:

```bash
cd ex1_students_db  # or ex2_exams_db
flutter pub get
flutter run
```

## Notes

- The machine used for setup did not have Flutter CLI installed, so projects were initialized from the first workshop template and adapted.
- Install dependencies with flutter pub get before first run.
