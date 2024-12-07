import 'package:flutter/material.dart';

/// Extensions for [BuildContext], useful for getting properties of the screen, theme, etc.
/// This extension approach makes it easier to access these properties in the code,
/// and makes the code more readable.
extension ContextExtensions on BuildContext {
  // Get the height of the screen
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // Get the width of the screen
  double get screenWidth => MediaQuery.sizeOf(this).width;

  // Get Theme related properties
  ThemeData get theme => Theme.of(this);
  TextTheme get textTWidgetheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Navigation helpers
  NavigatorState get navigator => Navigator.of(this);

  // Pop the current route
  void pop<T>([T? result]) => Navigator.pop(this, result);

  /// Push a new route, notice that this is a [Future]
  Future<T?> push<T>(String routeName) async {
    return Navigator.pushNamed<T>(this, routeName);
  }

  /// Replace the current route, notice that this is a [Future]
  Future<T?> replace<T>(String routeName) async {
    return Navigator.pushReplacementNamed<T, T>(this, routeName);
  }

  // Media Query helpers
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  Brightness get brightness => MediaQuery.platformBrightnessOf(this);
  bool get isDarkMode => brightness == Brightness.dark;

  // Screen size helpers
  Size get size => MediaQuery.sizeOf(this);

  // Get the device pixel ratio
  /// [MediaQuery.devicePixelRatioOf] is a getter that returns the device pixel ratio.
  /// This is the ratio of physical pixels to logical pixels.
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  // Check if the screen is landscape
  bool get isLandscape {
    return MediaQuery.orientationOf(this) == Orientation.landscape;
  }

  // Show a snackbar with error styling
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Show a snackbar with success styling
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
