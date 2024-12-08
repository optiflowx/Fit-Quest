import 'package:flutter/material.dart';

/// App color palette
class AppPalette {
  // Private constructor to prevent instantiation
  AppPalette._();

  /// Primary dark color - Dark Grey (#353A40)
  static const Color darkGrey = Color(0xFF353A40);
  
  /// Secondary dark color - Dark Grey (#353A40)
  /// Note: This is the same as darkGrey, consider if you need a different shade
  static const Color secondaryDark = Color(0xFF353A40);
  
  /// Muted teal/grey color (#91A5A7)
  static const Color mutedTeal = Color(0xFF91A5A7);
  
  /// Accent blue color (#5E68E6)
  static const Color accentBlue = Color(0xFF5E68E6);
  
  /// Orange accent color (#CD873C)
  static const Color accentOrange = Color(0xFFCD873C);
} 