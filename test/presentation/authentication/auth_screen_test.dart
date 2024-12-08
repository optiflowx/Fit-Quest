import 'package:fit_quest/presentation/authentication/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthScreen', () {
    testWidgets('renders AuthScreen', (tester) async {
      await tester.pumpWidget(
        const SignInView(),
      );
      
      await tester.pumpAndSettle();
      
      expect(find.byType(SignInView), findsOneWidget);
    });

    testWidgets('shows login form elements', (tester) async {
      await tester.pumpWidget(
        const SignInView(),
      );
      
      await tester.pumpAndSettle();
      
      // Verify form elements are present
      expect(find.byType(TextFormField), findsAtLeast(1));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('shows Google sign-in button', (tester) async {
      await tester.pumpWidget(
        const SignInView(),
      );
      
      await tester.pumpAndSettle();
      
      // Verify Google sign-in button is present
      expect(find.byIcon(Icons.g_mobiledata), findsOneWidget);
    });

    testWidgets('can enter text in email field', (tester) async {
      await tester.pumpWidget(
        const SignInView(),
      );
      
      await tester.pumpAndSettle();

      // Find email field and enter text
      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'test@example.com');
      
      expect(find.text('test@example.com'), findsOneWidget);
    });
  });
} 