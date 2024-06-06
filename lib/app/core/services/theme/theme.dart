import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  dialogBackgroundColor: Colors.white,
  useMaterial3: true,
  dividerTheme: DividerThemeData(
    color: Colors.grey.shade300,
    space: 0,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(
      Colors.white,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    modalElevation: 0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  ),
  primaryColor: const Color(0xFFF48121),
  primaryColorDark: const Color(0xFFE76901),
  scaffoldBackgroundColor: Colors.white,
  splashColor: Colors.white,
  cardColor: const Color(0xFF737375),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFF48121),
    disabledColor: Color(0xFFE5E5E5),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xFFF48121),
    selectionColor: const Color(0xFFF48121).withOpacity(0.5),
    selectionHandleColor: const Color(0xFFF48121),
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 12,
      height: 1.5,
    ),
    bodyLarge: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 16,
      height: 1.5,
    ),
    labelLarge: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 14,
      height: 1.5,
    ),
    displayLarge: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 25,
      height: 1.5,
    ),
    displayMedium: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 22,
      height: 1.5,
    ),
    displaySmall: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 20,
      height: 1.5,
    ),
    headlineMedium: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 18,
      height: 1.5,
    ),
    headlineSmall: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 16,
      height: 1.5,
    ),
    titleLarge: GoogleFonts.comfortaa(
      color: const Color(0xFF747476),
      fontSize: 14,
      height: 1.5,
    ),
  ),
  colorScheme: const ColorScheme(
    primary: Color(0xFFF48121),
    primaryContainer: Color(0xFFE76901),
    secondary: Color(0xFFF48121),
    secondaryContainer: Color(0xFFE76901),
    surface: Colors.red,
    error: Colors.red,
    onPrimary: Color(0xFFF48121),
    onSecondary: Color(0xFFF48121),
    onSurface: Color(0xFFF48121),
    onError: Colors.red,
    brightness: Brightness.light,
  ),
);
