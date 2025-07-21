
import 'package:flutter/material.dart';


class AppTheme {

  static const Color primaryBrown = Color(0xFF5A3A2B); 
 
  static const Color accentGold = Color(0xFFD4AF37); 
 
  static const Color lightBackground = Color(0xFFF5E5D4);

  static const Color darkText = Color(0xFF333333); 


  static ThemeData get brownTheme {
    return ThemeData(
    
      primaryColor: primaryBrown,
    
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: _createMaterialColor(primaryBrown), 
        accentColor: accentGold, 
        backgroundColor: lightBackground, 
      ).copyWith(
        onPrimary: Colors.white, // Ensure text on primary background is readable 
        secondary: accentGold,
      ),

      appBarTheme: const AppBarTheme(
        color: primaryBrown, 
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter', 
        ),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      
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
   
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentGold, 
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
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
          foregroundColor: primaryBrown,
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withAlpha((0.9 * 255).toInt()), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryBrown.withAlpha((0.5 * 255).toInt()), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentGold, width: 2), 
        ),
        labelStyle: TextStyle(color: primaryBrown.withAlpha((0.8 * 255).toInt())),
        hintStyle: TextStyle(color: darkText.withAlpha((0.6 * 255).toInt())),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      
      scaffoldBackgroundColor: lightBackground,
      
      fontFamily: 'Inter',
    );
  }


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