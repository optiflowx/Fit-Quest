import 'package:fit_quest/presentation/dashboard/widgets/dynamic_plan_card.dart';
import 'package:fit_quest/presentation/dashboard/widgets/plan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlanView', () {
    testWidgets('renders all plan cards', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlanView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify title is present
      expect(find.text('My Plan'), findsOneWidget);

      // Verify all plan cards are present
      expect(find.byType(DynamicPlanCard), findsNWidgets(4));

      // Verify specific plan cards
      expect(find.text('Workout'), findsOneWidget);
      expect(find.text('Meditation'), findsOneWidget);
      expect(find.text('Meal'), findsOneWidget);
      expect(find.text('Steps'), findsOneWidget);
    });

    testWidgets('shows correct icons for each plan card', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlanView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify icons are present
      expect(find.byIcon(Icons.fitness_center), findsOneWidget);
      expect(find.byIcon(Icons.fitbit), findsOneWidget);
      expect(find.byIcon(Icons.food_bank), findsOneWidget);
      expect(find.byIcon(Icons.directions_walk), findsOneWidget);
    });

    testWidgets('shows correct subtitles for each plan card', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlanView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify subtitles are present
      expect(find.text('2 hours'), findsOneWidget);
      expect(find.text('10 minutes'), findsOneWidget);
      expect(find.text('1200 Calories'), findsOneWidget);
      expect(find.text('10,000 Steps'), findsOneWidget);
    });
  });
} 