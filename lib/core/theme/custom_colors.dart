import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.background,
    required this.bottomNavigationBarBackground,
    required this.primary,
    required this.black,
    required this.white,
    required this.lightGrey,
    required this.container,
    required this.text,
  });

  final Color? background;
  final Color? bottomNavigationBarBackground;
  final Color? primary;
  final Color? black;
  final Color? white;
  final Color? lightGrey;
  final Color? container;
  final Color? text;
  @override
  ThemeExtension<CustomColors> copyWith({
    Color? background,
    Color? bottomNavigationBarBackground,
    Color? primary,
    Color? black,
    Color? white,
    Color? lightGrey,
    Color? container,
    Color? text,
  }) {
    return CustomColors(
      background: background ?? this.background,
      bottomNavigationBarBackground:
          bottomNavigationBarBackground ?? this.bottomNavigationBarBackground,
      primary: primary ?? this.primary,
      black: black ?? this.black,
      white: white ?? this.white,
      lightGrey: lightGrey ?? this.lightGrey,
      container: container ?? this.container,
      text: text ?? this.text,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      background: Color.lerp(background, other.background, t),
      bottomNavigationBarBackground: Color.lerp(
        bottomNavigationBarBackground,
        other.bottomNavigationBarBackground,
        t,
      ),
      primary: Color.lerp(primary, other.primary, t),
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t),
      lightGrey: Color.lerp(
        lightGrey,
        other.lightGrey,
        t,
      ),
      container: Color.lerp(
        container,
        other.container,
        t,
      ),
      text: Color.lerp(
        text,
        other.text,
        t,
      ),
    );
  }

  static const light = CustomColors(
    background: Color.fromARGB(255, 241, 241, 241),
    bottomNavigationBarBackground: Color(0xFFFFFFFF),
    primary: Color.fromARGB(255, 0, 169, 28),
    black: Color(0xFF000000),
    white: Color(0xFFFFFFFF),
    lightGrey: Color.fromARGB(255, 161, 160, 160),
    container: Color(0xFFFFFFFF),
    text: Color(0xFF000000),
  );

  static const dark = CustomColors(
    background: Color.fromARGB(255, 26, 26, 26),
    bottomNavigationBarBackground: Color(0xFF000000),
    primary: Color.fromARGB(255, 0, 169, 28),
    black: Color(0xFF000000),
    white: Color(0xFFFFFFFF),
    lightGrey: Color.fromARGB(255, 161, 160, 160),
    container: Color(0xFF000000),
    text: Color(0xFFFFFFFF),
  );
}

extension CustomColorScheme on BuildContext {
  CustomColors? get customColors => Theme.of(this).extension<CustomColors>();
}
