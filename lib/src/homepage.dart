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
  int numberOfExercises = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: sheet(), floatingActionButton: newSheetButton());
  }

  Widget sheet() {
    List<Exercise> exercises = pickRandomExercises(numberOfExercises);
    String reps = (Random().nextInt(maxReps) + 1).toString();
    String sets = (Random().nextInt(maxSets) + 1).toString();
    return ListView(
      children: List<Widget>.generate(
          numberOfExercises,
          (int index) =>
              exerciseAsWidget(exercises[index], sets: (sets + "x" + reps))),
      padding: const EdgeInsets.all(8),
    );
  }

  Widget newSheetButton() {
    return IconButton(
        onPressed: (() {
          setState(() {
            generateSheet();
          });
        }),
        icon: const Icon(Icons.casino));
  }
}

Widget exerciseAsWidget(Exercise exercise, {String sets = ""}) {
  return Text(exercise.exerciseName + sets + exercise.targetMuscle);
}

void generateSheet() {}

List<Exercise> pickRandomExercises(int numberOfExercises) {
  List<Exercise> exercises = populateExercises();
  List<Exercise> pickedExercises = <Exercise>[];
  for (var i = 0; i < numberOfExercises; i++) {
    Exercise randomExercise = exercises[Random().nextInt(exercises.length)];
    if (pickedExercises.contains(randomExercise) == false) {
      pickedExercises.add(randomExercise);
    }
  }
  return pickedExercises;
}

List<Exercise> populateExercises() {
  return <Exercise>[
    Exercise("Bench Press", targetMuscle: "chest"),
    Exercise("Chest Fly", targetMuscle: "chest"),
    Exercise("Regular Push Up", targetMuscle: "chest"),
    Exercise("Diamond Push Up", targetMuscle: "tricep"),
    Exercise("Overhead Extension", targetMuscle: "tricep"),
    Exercise("Overhead Press", targetMuscle: "shoulder"),
    Exercise("Dumbbell Curl", targetMuscle: "bicep"),
    Exercise("Squasts", targetMuscle: "leg"),
  ];
}
