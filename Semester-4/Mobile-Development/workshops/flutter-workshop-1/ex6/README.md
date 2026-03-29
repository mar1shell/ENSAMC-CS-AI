# Exercise 6 — Mini Quiz

A Flutter app that presents a multiple-choice question and shows coloured feedback depending on the answer chosen.

## What it does

- Displays the question: **"Quelle est la capitale du Maroc ?"**
- Three full-width answer buttons: **Rabat**, **Casablanca**, **Marrakech**
- Selecting **Rabat** shows green text *"Bonne réponse !"*
- Selecting any other answer shows red text *"Mauvaise réponse !"*
- Feedback updates immediately on every tap via `setState`

## Flutter concepts covered

| Concept | Where |
|---------|-------|
| `StatefulWidget` | `QuizPage` stores `_feedback` and `_feedbackColor` state |
| `setState` | Triggered in `_checkAnswer` to update feedback text and colour |
| Conditional logic | `if/else` inside `_checkAnswer` determines correctness |
| Dynamic `TextStyle` | `_feedbackColor` is applied at runtime to the feedback `Text` |
| `SizedBox(width: double.infinity)` | Makes each answer button span the full width |
| `ElevatedButton` with lambdas | Each button passes its own answer string to `_checkAnswer` |

## Running

```bash
flutter pub get
flutter run
```

## Project structure

```
ex6/
├── lib/
│   └── main.dart   # App entry point, QuizPage widget
└── pubspec.yaml
```
