import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xffffb690),
        onPrimary: Color(0xff552100),
        primaryContainer: Color(0xfff97316),
        onPrimaryContainer: Color(0xff582200),
        secondary: Color(0xffbcc7de),
        onSecondary: Color(0xff263143),
        surface: Color(0xff051424),
        onSurface: Color(0xffd4e4fa),
        background: Color(0xff051424),
        onBackground: Color(0xffd4e4fa),
        surfaceVariant: Color(0xff273647),
        outline: Color(0xffa78b7d),
      ),
      scaffoldBackgroundColor: const Color(0xff051424),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.inter(fontSize: 64, fontWeight: FontWeight.bold, height: 1.1, letterSpacing: -0.02),
        displayMedium: GoogleFonts.inter(fontSize: 48, fontWeight: FontWeight.bold, height: 1.1, letterSpacing: -0.02),
        headlineLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3),
        bodyLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.normal, height: 1.5),
        bodyMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal, height: 1.5),
        bodySmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, height: 1.4),
        labelLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, height: 1.0), // button text
      ),
    );
  }
}
