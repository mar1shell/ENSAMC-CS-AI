# Flutter Workshop

Hands-on Flutter exercises covering stateful widgets, user input, and dynamic UI updates.

## Structure

```
flutter-workshop/
├── ex4/   # Click Counter — StatefulWidget & setState
├── ex5/   # Mini To-Do List — TextEditingController & ListView
└── ex6/   # Mini Quiz — conditional rendering & color feedback
```

## Exercises

| Exercise | Topic | Description |
|----------|-------|-------------|
| [ex4](./ex4/) | State management basics | Button click counter with `setState` |
| [ex5](./ex5/) | User input & dynamic lists | To-do list with add/remove functionality |
| [ex6](./ex6/) | Conditional UI | Multiple-choice quiz with answer feedback |

## Running an Exercise

Each exercise is an independent Flutter project. Navigate into the exercise folder and run it:

```bash
cd ex4   # or ex5, ex6
flutter pub get
flutter run
```

## Requirements

- Flutter SDK >= 3.0.0
- Dart SDK ^3.11.1
- A connected device or emulator
