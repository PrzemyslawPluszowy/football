import 'package:flutter/material.dart';
import 'package:football/core/theme/app_sizes.dart';
import 'package:football/core/theme/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData light = ThemeData(
    textTheme: GoogleFonts.oswaldTextTheme(),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: CustomColors.light.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: bootomNavigationBar,
    appBarTheme: appBar,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.light,
    ],
  );
  static final ThemeData dark = ThemeData(
    textTheme: GoogleFonts.oswaldTextTheme(),
    scaffoldBackgroundColor: CustomColors.dark.background,
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: bootomNavigationBar,
    appBarTheme: appBar,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.dark,
    ],
  );

  static final bootomNavigationBar = BottomNavigationBarThemeData(
    backgroundColor: CustomColors.light.black,
    selectedItemColor: CustomColors.light.white,
    unselectedItemColor: CustomColors.light.lightGrey,
  );
  static final appBar = AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 0, 112, 19),
    elevation: 5,
    shadowColor: const Color.fromARGB(255, 0, 112, 19),
    foregroundColor: CustomColors.light.white,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: CustomColors.light.white,
    ),
    actionsIconTheme: IconThemeData(
      color: CustomColors.light.white,
    ),
    titleTextStyle: TextStyle(
      color: CustomColors.light.white,
      fontSize: Sizes.p16,
      fontWeight: FontWeight.bold,
    ),
  );
}
