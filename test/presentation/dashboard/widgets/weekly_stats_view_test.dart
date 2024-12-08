import 'package:fit_quest/presentation/dashboard/widgets/daily_stat_bar.dart';
import 'package:fit_quest/presentation/dashboard/widgets/weekly_stats_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeeklyStatsView', () {
    testWidgets('renders weekly stats title and subtitle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeeklyStatsView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify title is present
      expect(find.text('Weekly Stats'), findsOneWidget);
      expect(find.text('Most Active Day: '), findsOneWidget);
      expect(find.text('Fri'), findsOneWidget);
    });

    testWidgets('shows all days of the week', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeeklyStatsView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify all days are present
      for (final day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']) {
        expect(find.text(day), findsOneWidget);
      }
    });

    testWidgets('renders correct number of stat bars', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeeklyStatsView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify number of stat bars
      expect(find.byType(DailyStatBar), findsNWidgets(7));
    });

    testWidgets('highlights Friday as most active day', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeeklyStatsView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find all DailyStatBar widgets
      final bars = tester.widgetList<DailyStatBar>(find.byType(DailyStatBar));
      
      // Verify that Friday (index 4) is highlighted
      expect(
        bars.elementAt(4).isHighlighted,
        isTrue,
      );
    });
  });
} 