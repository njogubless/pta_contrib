// app_theme.dart
import 'package:flutter/material.dart';

/// Defines the custom theme for the application, inspired by the provided logo.
/// It uses a warm brown as the primary color with gold accents.
class AppTheme {
  // Define the primary brown color from the logo
  static const Color primaryBrown = Color(0xFF5A3A2B); // A deep, rich brown
  // Define an accent gold color from the logo
  static const Color accentGold = Color(0xFFD4AF37); // A vibrant gold
  // Define a lighter background color that complements the brown
  static const Color lightBackground = Color(0xFFF5E5D4); // A soft, creamy brown
  // Define a darker text color for contrast on light backgrounds
  static const Color darkText = Color(0xFF333333); // A dark grey for readability

  /// Returns the ThemeData object configured with the app's brown and gold theme.
  static ThemeData get brownTheme {
    return ThemeData(
      // Set the primary color for the app
      primaryColor: primaryBrown,
      // Define the color scheme for various UI elements
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _createMaterialColor(primaryBrown), // Generate a MaterialColor from primaryBrown
        accentColor: accentGold, // Set the accent color
        backgroundColor: lightBackground, // Set the background color
        // Ensure text on primary background is readable
        onPrimary: Colors.white,
        // Ensure text on background is readable
        onBackground: darkText,
      ).copyWith(
        secondary: accentGold, // Use accentGold as the secondary color
      ),
      // Configure the AppBar theme
      appBarTheme: const AppBarTheme(
        color: primaryBrown, // AppBar background color
        elevation: 0, // No shadow for a flat design
        titleTextStyle: TextStyle(
          color: Colors.white, // AppBar title text color
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter', // Custom font for a clean look
        ),
        iconTheme: IconThemeData(color: Colors.white), // AppBar icon color
      ),
      // Configure the text theme for various text styles
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: darkText,
            fontFamily: 'Inter'),
        headlineMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: darkText,
            fontFamily: 'Inter'),
        headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: darkText,
            fontFamily: 'Inter'),
        titleLarge: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: darkText,
            fontFamily: 'Inter'),
        titleMedium: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: darkText,
            fontFamily: 'Inter'),
        bodyLarge: TextStyle(
            fontSize: 16.0, color: darkText, fontFamily: 'Inter'),
        bodyMedium: TextStyle(
            fontSize: 14.0, color: darkText, fontFamily: 'Inter'),
        labelLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Inter'),
      ),
      // Configure button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentGold, // Button background color
          foregroundColor: Colors.white, // Button text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for buttons
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryBrown, // Text button color
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
          ),
        ),
      ),
      // Configure input decoration theme for text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.9), // Light background for input fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners for input fields
          borderSide: BorderSide.none, // No border for a cleaner look
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryBrown.withOpacity(0.5), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentGold, width: 2), // Accent border when focused
        ),
        labelStyle: TextStyle(color: primaryBrown.withOpacity(0.8)),
        hintStyle: TextStyle(color: darkText.withOpacity(0.6)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      // Configure card theme
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners for cards
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      // Set the overall scaffold background color
      scaffoldBackgroundColor: lightBackground,
      // Apply a custom font family globally if desired
      fontFamily: 'Inter',
    );
  }

  /// Helper function to create a MaterialColor from a single Color.
  /// This is useful for `primarySwatch` which requires a MaterialColor.
  static MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}