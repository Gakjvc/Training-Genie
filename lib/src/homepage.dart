import 'package:flutter/material.dart';
import 'package:training_genie/src/exercise.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Exercise> exercises = <Exercise>[
    Exercise(exerciseName: "Bench Press", targetMuscle: "chest"),
    Exercise(exerciseName: "Chest Fly", targetMuscle: "chest"),
    Exercise(exerciseName: "Regular Push Up", targetMuscle: "chest"),
    Exercise(exerciseName: "Diamond Push Up", targetMuscle: "tricep"),
    Exercise(exerciseName: "Overhead Extension", targetMuscle: "tricep"),
  ];
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
              sets: (Random().nextInt(20).toString() +
                  "x" +
                  Random().nextInt(5).toString()))),
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
