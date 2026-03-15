# Exercise 5 — Mini To-Do List

A Flutter app that lets users type tasks, add them to a list, and remove them by tapping.

## What it does

- A `TextField` accepts free-text task input (hint: *"Écrire une tâche..."*)
- Pressing **"Ajouter"** appends the task to the list and clears the input
- Tasks are displayed in a scrollable `ListView` as `Card` tiles
- Tapping a task tile removes it from the list immediately

## Flutter concepts covered

| Concept | Where |
|---------|-------|
| `StatefulWidget` | `TodoListPage` owns the `_tasks` list and rebuilds on changes |
| `setState` | Used in both `_addTask` and `_removeTask` |
| `TextEditingController` | Reads the `TextField` value and clears it after adding |
| `ListView.builder` | Efficiently renders a dynamic list of tasks |
| `Card` / `ListTile` | Material widgets for styled list items |
| `dispose` | Controller is disposed when the widget is removed from the tree |

## Running

```bash
flutter pub get
flutter run
```

## Project structure

```
ex5/
├── lib/
│   └── main.dart   # App entry point, TodoListPage widget
└── pubspec.yaml
```
