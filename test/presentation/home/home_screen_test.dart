import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_quest/presentation/home/home_screen.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('renders HomeScreen', (tester) async {
      await tester.pumpWidget(
        const HomeScreen(),
      );

      await tester.pumpAndSettle();

      // Verify basic UI elements are present
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('shows bottom navigation bar', (tester) async {
      await tester.pumpWidget(
        const HomeScreen(),
      );

      await tester.pumpAndSettle();

      // Verify bottom navigation bar is present
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('shows app bar', (tester) async {
      await tester.pumpWidget(
        const HomeScreen(),
      );

      await tester.pumpAndSettle();

      // Verify app bar is present
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
