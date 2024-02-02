import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_res.dart';

class CustomTheme {
  static final ThemeData baseLight = ThemeData.light();

  static final lightTheme = baseLight.copyWith(
      textTheme: _lightTextTheme(baseLight.textTheme),
      primaryColor: ColorRes.primaryColor,
      canvasColor: ColorRes.canvasColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          color: ColorRes.primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          )),
      colorScheme: const ColorScheme.light(
        primary: ColorRes.primaryColor,
        secondary: Colors.deepOrange,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
      ));

  static TextTheme _lightTextTheme(TextTheme base) {
    return base.copyWith(
      bodyLarge: base.bodyLarge!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
