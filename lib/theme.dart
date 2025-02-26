import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff413f3f),
      surfaceTint: Color(0xff615e5e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff595656),
      onPrimaryContainer: Color(0xffd1cbcb),
      secondary: Color(0xff605e5e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe6e1e1),
      onSecondaryContainer: Color(0xff666463),
      tertiary: Color(0xff403f3e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff585655),
      onTertiaryContainer: Color(0xffcfcbca),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff4d4546),
      outline: Color(0xff7e7576),
      outlineVariant: Color(0xffcfc4c5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffcac5c5),
      primaryFixed: Color(0xffe7e1e1),
      onPrimaryFixed: Color(0xff1d1b1b),
      primaryFixedDim: Color(0xffcac5c5),
      onPrimaryFixedVariant: Color(0xff494646),
      secondaryFixed: Color(0xffe6e1e1),
      onSecondaryFixed: Color(0xff1c1b1b),
      secondaryFixedDim: Color(0xffcac5c5),
      onSecondaryFixedVariant: Color(0xff484646),
      tertiaryFixed: Color(0xffe6e2e0),
      onTertiaryFixed: Color(0xff1c1b1b),
      tertiaryFixedDim: Color(0xffcac6c4),
      onTertiaryFixedVariant: Color(0xff484645),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e6),
      surfaceContainerHighest: Color(0xffe6e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff383636),
      surfaceTint: Color(0xff615e5e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff595656),
      onPrimaryContainer: Color(0xfffffbff),
      secondary: Color(0xff373636),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f6c6c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff373635),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff585655),
      onTertiaryContainer: Color(0xfffffaf9),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff121111),
      onSurfaceVariant: Color(0xff3b3436),
      outline: Color(0xff595052),
      outlineVariant: Color(0xff746b6c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffcac5c5),
      primaryFixed: Color(0xff706c6c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff575454),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f6c6c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff565454),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6f6c6b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff565453),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xffebe7e6),
      surfaceContainerHigh: Color(0xffe0dcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2e2c2c),
      surfaceTint: Color(0xff615e5e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4b4848),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2d2c2c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4b4948),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2d2c2b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4a4948),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff312a2c),
      outlineVariant: Color(0xff4f4748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffcac5c5),
      primaryFixed: Color(0xff4b4848),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff343232),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4b4948),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff343232),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4a4948),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff343231),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe6e2e1),
      surfaceContainerHigh: Color(0xffd7d3d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcac5c5),
      surfaceTint: Color(0xffcac5c5),
      onPrimary: Color(0xff323030),
      primaryContainer: Color(0xff595656),
      onPrimaryContainer: Color(0xffd1cbcb),
      secondary: Color(0xffcac5c5),
      onSecondary: Color(0xff323030),
      secondaryContainer: Color(0xff484646),
      onSecondaryContainer: Color(0xffb8b4b4),
      tertiary: Color(0xffcac6c4),
      onTertiary: Color(0xff31302f),
      tertiaryContainer: Color(0xff585655),
      onTertiaryContainer: Color(0xffcfcbca),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe6e2e1),
      onSurfaceVariant: Color(0xffcfc4c5),
      outline: Color(0xff988e8f),
      outlineVariant: Color(0xff4d4546),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2e1),
      inversePrimary: Color(0xff615e5e),
      primaryFixed: Color(0xffe7e1e1),
      onPrimaryFixed: Color(0xff1d1b1b),
      primaryFixedDim: Color(0xffcac5c5),
      onPrimaryFixedVariant: Color(0xff494646),
      secondaryFixed: Color(0xffe6e1e1),
      onSecondaryFixed: Color(0xff1c1b1b),
      secondaryFixedDim: Color(0xffcac5c5),
      onSecondaryFixedVariant: Color(0xff484646),
      tertiaryFixed: Color(0xffe6e2e0),
      onTertiaryFixed: Color(0xff1c1b1b),
      tertiaryFixedDim: Color(0xffcac6c4),
      onTertiaryFixedVariant: Color(0xff484645),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0f0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff363434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe1dbdb),
      surfaceTint: Color(0xffcac5c5),
      onPrimary: Color(0xff272525),
      primaryContainer: Color(0xff949090),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0dbdb),
      onSecondary: Color(0xff272525),
      secondaryContainer: Color(0xff939090),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe0dbda),
      onTertiary: Color(0xff262525),
      tertiaryContainer: Color(0xff93908f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe6d9db),
      outline: Color(0xffbaafb0),
      outlineVariant: Color(0xff988e8f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2e1),
      inversePrimary: Color(0xff4a4747),
      primaryFixed: Color(0xffe7e1e1),
      onPrimaryFixed: Color(0xff121111),
      primaryFixedDim: Color(0xffcac5c5),
      onPrimaryFixedVariant: Color(0xff383636),
      secondaryFixed: Color(0xffe6e1e1),
      onSecondaryFixed: Color(0xff121111),
      secondaryFixedDim: Color(0xffcac5c5),
      onSecondaryFixedVariant: Color(0xff373636),
      tertiaryFixed: Color(0xffe6e2e0),
      onTertiaryFixed: Color(0xff121110),
      tertiaryFixedDim: Color(0xffcac6c4),
      onTertiaryFixedVariant: Color(0xff373635),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff464444),
      surfaceContainerLowest: Color(0xff080707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff292827),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3f3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff4efee),
      surfaceTint: Color(0xffcac5c5),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc6c1c1),
      onPrimaryContainer: Color(0xff0c0b0b),
      secondary: Color(0xfff4efee),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc6c2c1),
      onSecondaryContainer: Color(0xff0c0b0b),
      tertiary: Color(0xfff4efed),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc6c2c0),
      onTertiaryContainer: Color(0xff0c0b0a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffaedee),
      outlineVariant: Color(0xffcbc0c1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2e1),
      inversePrimary: Color(0xff4a4747),
      primaryFixed: Color(0xffe7e1e1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffcac5c5),
      onPrimaryFixedVariant: Color(0xff121111),
      secondaryFixed: Color(0xffe6e1e1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcac5c5),
      onSecondaryFixedVariant: Color(0xff121111),
      tertiaryFixed: Color(0xffe6e2e0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcac6c4),
      onTertiaryFixedVariant: Color(0xff121110),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff484646),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
