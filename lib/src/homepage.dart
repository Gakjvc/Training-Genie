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
    return ListView(
      children: List<Widget>.generate(numberOfExercises, (int index) {
        String reps = (Random().nextInt(maxReps) + 1).toString();
        String sets = (Random().nextInt(maxSets) + 1).toString();
        return exerciseAsWidget(exercises[index], sets: (sets + "x" + reps));
      }),
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
  return ListTile(
    title: Text(exercise.exerciseName + " " + sets),
    subtitle: Text(exercise.targetMuscle),
  );
}

void generateSheet() {}

List<Exercise> pickRandomExercises(int numberOfExercises,
    [String targetMuscle = ""]) {
  List<Exercise> exercises = populateExercises();
  if (targetMuscle != "") {
    for (var item in exercises) {
      if (item.targetMuscle != targetMuscle) {
        exercises.remove(item);
      }
    }
  }
  List<Exercise> pickedExercises = <Exercise>[];
  while (pickedExercises.length < numberOfExercises) {
    Exercise randomExercise = exercises[Random().nextInt(exercises.length)];
    if (!pickedExercises.contains(randomExercise)) {
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
    Exercise("Squats", targetMuscle: "leg"),
  ];
}
