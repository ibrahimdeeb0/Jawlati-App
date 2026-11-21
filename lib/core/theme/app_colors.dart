import 'package:flutter/material.dart';

/// A utility class for app colors. Should not be instantiated.
class AppColors {
  AppColors._();
  
  //? Primary Colors - Blues
  static const Color mainBlue = Color(0xFF4A90E2);
  static const Color blue = Color(0xFF6BA3F0); // Secondary blue
  static const Color lightBlue = Color(0xFFE8F2FF); // Background light blue
  static const Color darkBlue = Color(0xFF2D5AA0); // Darker shade for emphasis
  
  //? Orange Colors - Accent colors
  static const Color mainOrange = Color(0xFFFF6B35); // Main orange from logo
  static const Color lightOrange = Color(0xFFFFE5DC); // Light orange background
  static const Color darkOrange = Color(0xFFE55A2B); // Darker orange for emphasis
  
  //? Gray Scale - Neutral colors
  static const Color mainGray = Color(0xFF9B9B9B); // Main gray from logo
  static const Color gray = Color(0xFF757575); // Neutral gray for text
  static const Color darkGray = Color(0xFF424242); // Dark gray for primary text
  static const Color lightGray = Color(0xFFE0E0E0); // Light gray for borders/backgrounds
  static const Color extraLightGray = Color(0xFFF5F5F5); // Extra light background
  
  //? Black Scale
  static const Color lighterBlack = Color(0xFF212121); // For dark mode backgrounds
  
  //? Status Colors
  static const Color red = Color(0xFFE53E3E);
  static const Color green = Color(0xFF38A169);
  static const Color lightGreen = Color(0xFF48BB78);
  
  //? Text Colors
  static const Color textPrimary = darkGray; // Primary text color
  static const Color textSecondary = gray; // Secondary text color
  static const Color textInverse = Colors.white; // Text on dark backgrounds
  
  //? Background Colors
  static const Color backgroundPrimary = Colors.white; // Primary light background
  static const Color backgroundSecondary = lightBlue; // Secondary background
  static const Color backgroundAccent = lightOrange; // Orange accent background
  static const Color fillColor = extraLightGray;
  
  //? Border Colors
  static const Color borderGray = lightGray; // Light gray for borders
  static const Color borderBlue = mainBlue; // Blue borders for focus states
  
  //? Button Colors
  static const Color buttonPrimary = mainBlue; // Primary button color (blue)
  static const Color buttonSecondary = mainOrange; // Secondary button color (orange)
  static const Color buttonTertiary = mainGray; // Tertiary button color (gray)
  
  //? Brand Colors (Direct from logo)
  static const Color brandBlue = Color(0xFF4A90E2); // Exact blue from logo
  static const Color brandOrange = Color(0xFFFF6B35); // Exact orange from logo
  static const Color brandGray = Color(0xFF9B9B9B); // Exact gray from logo
  
  //? Status Colors (Refined)
  // Success
  static const Color successGreen = Color(0xFF38A169); // A professional green
  // Error
  static const Color errorRed = Color(0xFFE53E3E); // A clean red
  // Warning
  static const Color warningOrange = mainOrange; // Using brand orange for consistency
  // Info
  static const Color infoBlue = mainBlue; // Using brand blue for consistency
}
