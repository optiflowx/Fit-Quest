# Flutter Extensions Documentation

This document outlines the custom extensions available in the project for enhanced Flutter development.

## Context Extensions

The `ContextExtensions` provides convenient access to commonly used Flutter properties and methods through `BuildContext`.

### Screen Properties

- `screenHeight` - Gets the screen height
- `screenWidth` - Gets the screen width
- `size` - Gets the screen size as a `Size` object
- `devicePixelRatio` - Gets the ratio of physical pixels to logical pixels
- `isLandscape` - Checks if the screen is in landscape orientation

### Theme Access

- `theme` - Gets the current `ThemeData`
- `textTheme` - Gets the current `TextTheme`
- `colorScheme` - Gets the current `ColorScheme`

### Navigation Helpers

- `navigator` - Gets the `NavigatorState`
- `pop<T>([T? result])` - Pops the current route
- `push<T>(Widget widget)` - Pushes a new route with the given widget

### Media Query Helpers

- `padding` - Gets the padding from `MediaQuery`
- `viewInsets` - Gets the view insets from `MediaQuery`
- `brightness` - Gets the platform brightness
- `isDarkMode` - Checks if the device is in dark mode

### Usage Examples

```dart
// Navigation using AppRoutes
context.push(AppRoutes.login);
context.push(AppRoutes.home);

// Conditional navigation example
onButtonPress() {
  isAuthenticated 
    ? context.push(AppRoutes.home)
    : context.push(AppRoutes.login);
}

// Screen Properties Example
Container(
  width: context.screenWidth * 0.8,  // 80% of screen width
  height: context.screenHeight * 0.3, // 30% of screen height
  child: YourWidget(),
)
