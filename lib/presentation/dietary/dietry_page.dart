import 'package:fit_quest/presentation/dietary/widgets/bmi_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/dietary_plan_item.dart';

class DietryPage extends StatelessWidget {
  const DietryPage({super.key});

  static const List<({String title, String description, IconData icon})>
      dietPlans = [
    (
      title: 'Weight Loss Diet',
      description: 'A diet plan designed for those looking to lose weight.',
      icon: Icons.fastfood,
    ),
    (
      title: 'Muscle Gain Diet',
      description: 'A plan focused on gaining lean muscle mass.',
      icon: Icons.fitness_center,
    ),
    (
      title: 'Balanced Diet',
      description: 'A diet for overall health and maintenance.',
      icon: Icons.health_and_safety,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet & Nutrition Plans'),
        backgroundColor: Colors.green, // Change to your preferred color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BMI Calculator Card
              const BMIWidgetCard(),
              const SizedBox(height: 20),
              const Text(
                'Diet Plans',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              ...List.generate(dietPlans.length, (index) {
                final plan = dietPlans[index];

                return DietPlanCard(
                  title: plan.title,
                  description: plan.description,
                  icon: plan.icon,
                  onTap: () {
                    // Navigate to detailed diet plan or more information
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class BMICalculator {
  final double weight; // in kilograms
  final double height; // in meters

  BMICalculator({required this.weight, required this.height});

  double calculateBMI() {
    return weight / (height * height);
  }

  String getBMICategory() {
    double bmi = calculateBMI();
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
