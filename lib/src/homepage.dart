import 'package:flutter/material.dart';
import 'package:training_genie/src/exercise.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int maxSets = 5;
  int maxReps = 20;
  List<Exercise> exercises = PopulateExercises();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Sheet(), floatingActionButton: NewSheetButton());
  }

  Widget Sheet() {
    return ListView(
      children: List<Widget>.generate(
          exercises.length,
          (int index) => ExerciseAsWidget(
              exercises[Random().nextInt(exercises.length)],
              sets: ((Random().nextInt(maxReps) + 1).toString() +
                  "x" +
                  (Random().nextInt(maxSets) + 1).toString()))),
      padding: const EdgeInsets.all(8),
    );
  }

  Widget NewSheetButton() {
    return IconButton(
        onPressed: (() {
          setState(() {
            GenerateSheet();
          });
        }),
        icon: Icon(Icons.casino));
  }
}

Widget ExerciseAsWidget(Exercise exercise, {String sets = ""}) {
  return Text(exercise.exerciseName + sets + exercise.targetMuscle);
}

void GenerateSheet() {}

List<Exercise> PopulateExercises() {
  return <Exercise>[
    Exercise("Bench Press", targetMuscle: "chest"),
    Exercise("Chest Fly", targetMuscle: "chest"),
    Exercise("Regular Push Up", targetMuscle: "chest"),
    Exercise("Diamond Push Up", targetMuscle: "tricep"),
    Exercise("Overhead Extension", targetMuscle: "tricep")
  ];
}
