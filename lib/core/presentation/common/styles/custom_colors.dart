import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors.of(BuildContext context) : _context = context;
  final BuildContext _context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get primaryText => Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
  Color get backgroundEndGradient => Theme.of(_context).extension<CustomColorScheme>()!.backgroundEndGradient!;
  Color get backgroundStartGradient => Theme.of(_context).extension<CustomColorScheme>()!.backgroundStartGradient!;
  Color get tubeOutlineColor => Theme.of(_context).extension<CustomColorScheme>()!.tubeOutlineColor!;
  Color get appBarGradientFirst => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientFirst!;
  Color get appBarGradientSecond => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientSecond!;
  Color get appBarGradientThird => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientThird!;
  Color get appBarGradientFourth => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientFourth!;
  Color get appBarGradientFifth => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientFifth!;
  Color get appBarTabSplash => Theme.of(_context).extension<CustomColorScheme>()!.appBarTabSplash!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  const CustomColorScheme({
    required this.primary,
    required this.primaryText,
    required this.backgroundEndGradient,
    required this.backgroundStartGradient,
    required this.tubeOutlineColor,
    required this.appBarGradientFirst,
    required this.appBarGradientSecond,
    required this.appBarGradientThird,
    required this.appBarGradientFourth,
    required this.appBarGradientFifth,
    required this.appBarTabSplash,
  });

  CustomColorScheme.classic()
      : primary = Colors.blue,
        primaryText = const Color(0xFF13123A),
        backgroundEndGradient = const Color(0xFF000000),
        backgroundStartGradient = const Color(0xFF403e3e),
        tubeOutlineColor = const Color(0xFF0d4015),
        appBarGradientFirst = const Color(0xFF40372d),
        appBarGradientSecond = const Color(0xFF282c2b),
        appBarGradientThird = const Color(0xFF18232f),
        appBarGradientFourth = const Color(0xFF182331),
        appBarGradientFifth = const Color(0xFF182330),
        appBarTabSplash = Colors.white.withValues(alpha: 0.1);

  final Color? primary;
  final Color? primaryText;
  final Color? backgroundEndGradient;
  final Color? backgroundStartGradient;
  final Color? tubeOutlineColor;
  final Color? appBarGradientFirst;
  final Color? appBarGradientSecond;
  final Color? appBarGradientThird;
  final Color? appBarGradientFourth;
  final Color? appBarGradientFifth;
  final Color? appBarTabSplash;

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? primaryText,
    Color? backgroundEndGradient,
    Color? backgroundStartGradient,
    Color? tubeOutlineColor,
    Color? appBarGradientFirst,
    Color? appBarGradientSecond,
    Color? appBarGradientThird,
    Color? appBarGradientFourth,
    Color? appBarGradientFifth,
    Color? appBarTabSplash,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      primaryText: primaryText ?? this.primaryText,
      backgroundEndGradient: backgroundEndGradient ?? this.backgroundEndGradient,
      backgroundStartGradient: backgroundStartGradient ?? this.backgroundStartGradient,
      tubeOutlineColor: tubeOutlineColor ?? this.tubeOutlineColor,
      appBarGradientFirst: appBarGradientFirst ?? this.appBarGradientFirst,
      appBarGradientSecond: appBarGradientSecond ?? this.appBarGradientSecond,
      appBarGradientThird: appBarGradientThird ?? this.appBarGradientThird,
      appBarGradientFourth: appBarGradientFourth ?? this.appBarGradientFourth,
      appBarGradientFifth: appBarGradientFifth ?? this.appBarGradientFifth,
      appBarTabSplash: appBarTabSplash ?? this.appBarTabSplash,
    );
  }

  @override
  ThemeExtension<CustomColorScheme> lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) return this;
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      backgroundEndGradient: Color.lerp(backgroundEndGradient, other.backgroundEndGradient, t),
      backgroundStartGradient: Color.lerp(backgroundStartGradient, other.backgroundStartGradient, t),
      tubeOutlineColor: Color.lerp(tubeOutlineColor, other.tubeOutlineColor, t),
      appBarGradientFirst: Color.lerp(appBarGradientFirst, other.appBarGradientFirst, t),
      appBarGradientSecond: Color.lerp(appBarGradientSecond, other.appBarGradientSecond, t),
      appBarGradientThird: Color.lerp(appBarGradientThird, other.appBarGradientThird, t),
      appBarGradientFourth: Color.lerp(appBarGradientFourth, other.appBarGradientFourth, t),
      appBarGradientFifth: Color.lerp(appBarGradientFifth, other.appBarGradientFifth, t),
      appBarTabSplash: Color.lerp(appBarTabSplash, other.appBarTabSplash, t),
    );
  }
}
