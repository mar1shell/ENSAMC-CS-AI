# Exercise 4 — Click Counter

A simple Flutter app that counts button presses and displays the total on screen.

## What it does

- Displays a counter label: **"Nombre de clics : N"**
- A button labelled **"Cliquer ici"** increments the counter each time it is pressed
- The counter value updates instantly via `setState`

## Flutter concepts covered

| Concept | Where |
|---------|-------|
| `StatefulWidget` | `MyHomePage` holds mutable `_counter` state |
| `setState` | Called inside `_incrementCounter` to trigger a UI rebuild |
| `ElevatedButton` | Tappable widget that invokes the callback |
| `AppBar` / `Scaffold` | Basic Material Design page structure |
| `Column` + `Center` | Vertical centering of widgets |

## Running

```bash
flutter pub get
flutter run
```

## Project structure

```
ex4/
├── lib/
│   └── main.dart   # App entry point and widget tree
├── image/
│   └── ordinateur.png
└── pubspec.yaml
```
