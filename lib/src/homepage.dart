import 'package:flutter/material.dart';
import 'package:training_genie/src/exercise.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sheet(),
      floatingActionButton: newSheetButton(),
      appBar: AppBar(
        title: targetMuscleField(),
        leading: numberPicker(),
      ),
    );
  }

  Widget testAppbar() {
    return AppBar(
      title: targetMuscleField(),
      leading: numberPicker(),
    );
  }

  var muscleGroups = ['', 'leg', 'triceps', 'chest', 'biceps', 'shoulder'];
  String targetMuscleValue = '';
  Widget targetMuscleField() {
    return DropdownButton(
        value: targetMuscleValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: muscleGroups.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            targetMuscleValue = newValue!;
          });
        });
  }

  var numberOptions = [1, 2, 3, 4, 5, 6, 7, 8];
  int numberOfExercises = 1;
  Widget numberPicker() {
    return DropdownButton(
        value: numberOfExercises,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: numberOptions.map((int items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items.toString()),
          );
        }).toList(),
        onChanged: (int? newValue) {
          setState(() {
            numberOfExercises = newValue!;
          });
        });
  }

  int maxSets = 5;
  int maxReps = 20;

  Widget sheet() {
    List<Exercise> exercises =
        pickRandomExercises(numberOfExercises, targetMuscleValue);
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
    var toRemove = [];
    for (var item in exercises) {
      if (item.targetMuscle != targetMuscle) {
        toRemove.add(item);
      }
    }
    for (var removable in toRemove) {
      exercises.remove(removable);
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
