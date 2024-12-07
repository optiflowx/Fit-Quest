import 'package:fit_quest/core/models/exercise_data.dart';
import 'package:flutter/material.dart';

import 'widget/exercise_card.dart';

class ExercisePage extends StatefulWidget {
  static const routeName = '/exercise-screen';

  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final exerciseList = [
    ExerciseData(
      title: 'Push-Ups',
      description: 'A basic upper body strength exercise.',
      icon: Icons.fitness_center,
    ),
    ExerciseData(
      title: 'Jumping Jacks',
      description: 'A great warm-up cardio exercise.',
      icon: Icons.run_circle,
    ),
    ExerciseData(
      title: 'Squats',
      description: 'A lower body strength exercise.',
      icon: Icons.accessibility_new,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercises & Warm-Ups',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Change to your preferred color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Available Exercises & Warm-Ups',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                exerciseList.length,
                (index) {
                  final exercise = exerciseList[index];
                  return ExerciseCard(
                    title: exercise.title,
                    description: exercise.description,
                    icon: exercise.icon,
                    onTap: () {
                      // Navigate to details or video for this exercise
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ExerciseCard Widget for displaying individual exercise details

