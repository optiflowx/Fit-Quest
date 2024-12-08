import 'package:bloc_test/bloc_test.dart';
import 'package:fit_quest/presentation/dashboard/dashboard_view.dart';
import 'package:fit_quest/presentation/dashboard/state/dashboard_cubit.dart';
import 'package:fit_quest/presentation/dashboard/state/dashboard_state.dart';
import 'package:fit_quest/presentation/dashboard/widgets/plan_view.dart';
import 'package:fit_quest/presentation/dashboard/widgets/weekly_stats_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDashboardCubit extends MockCubit<DashboardState>
    implements DashboardCubit {}

void main() {
  late MockDashboardCubit mockCubit;

  setUp(() {
    mockCubit = MockDashboardCubit();
  });

  group('DashboardView', () {
    testWidgets('renders all components correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCubit,
            child: const DashboardView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify header text is present
      expect(find.text("EVERYDAY WE'RE MUSCLE'N"), findsOneWidget);
      expect(find.text('Hello, John👋'), findsOneWidget);

      // Verify main components are present
      expect(find.byType(PlanView), findsOneWidget);
      expect(find.byType(WeeklyStatsView), findsOneWidget);
    });

    testWidgets('scrolls content vertically', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCubit,
            child: const DashboardView(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final scrollFinder = find.byType(SingleChildScrollView);
      expect(scrollFinder, findsOneWidget);

      await tester.drag(scrollFinder, const Offset(0, -500));
      await tester.pumpAndSettle();
    });
  });
}
