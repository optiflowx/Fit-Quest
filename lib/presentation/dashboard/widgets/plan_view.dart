import 'package:fit_quest/app/app_palette.dart';
import 'package:fit_quest/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'dynamic_plan_card.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstraintLayout(height: wrapContent).open(() {
      final planTitle = ConstraintId('plan-title');
      final workoutContainer = ConstraintId('workout-container');
      final mealContainer = ConstraintId('meal-container');
      final stepsContainer = ConstraintId('steps-container');
      final meditationContainer = ConstraintId('meditation-container');

      const Text(
        "My Plan",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ).applyConstraint(id: planTitle, top: parent.top, left: parent.left);

      DynamicPlanCard(
        title: "Workout",
        subtitle: "2 hours",
        icon: Icons.fitness_center,
        backgroundColor: AppPalette.accentBlue,
        onTap: () {},
      ).applyConstraint(
        height: 120,
        left: parent.left,
        id: workoutContainer,
        top: planTitle.bottom,
        width: context.screenWidth * 0.55,
      );

      DynamicPlanCard(
        title: "Meditation",
        subtitle: "10 minutes",
        icon: Icons.fitbit,
        iconBackgroundColor: AppPalette.accentBlue,
        onTap: () {},
      ).applyConstraint(
        height: 140,
        id: meditationContainer,
        top: planTitle.bottom,
        left: workoutContainer.right,
        right: parent.right,
        width: context.screenWidth * 0.35,
      );

      DynamicPlanCard(
        title: "Meal",
        subtitle: "1200 Calories",
        icon: Icons.food_bank,
        direction: Axis.horizontal,
        iconBackgroundColor: AppPalette.accentOrange,
        onTap: () {},
      ).applyConstraint(
        height: 80,
        id: mealContainer,
        left: parent.left,
        top: workoutContainer.bottom,
        width: context.screenWidth * 0.45,
        margin: const EdgeInsets.only(top: 5),
      );

      DynamicPlanCard(
        title: "Steps",
        subtitle: "10,000 Steps",
        icon: Icons.directions_walk,
        direction: Axis.horizontal,
        backgroundColor: AppPalette.accentOrange,
        onTap: () {},
      ).applyConstraint(
        height: 100,
        id: stepsContainer,
        right: parent.right,
        left: mealContainer.right,
        top: meditationContainer.bottom,
        margin: const EdgeInsets.only(top: 5),
        width: context.screenWidth * 0.45,
      );
    });
  }
}
