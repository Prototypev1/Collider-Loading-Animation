import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors.of(BuildContext context) : _context = context;
  final BuildContext _context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get primaryText => Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
  Color get backgroundEndGradient => Theme.of(_context).extension<CustomColorScheme>()!.backgroundEndGradient!;
  Color get backgroundStartGradient => Theme.of(_context).extension<CustomColorScheme>()!.backgroundStartGradient!;
  Color get editProfileBackground => Theme.of(_context).extension<CustomColorScheme>()!.editProfileBackground!;
  Color get textFieldLabel => Theme.of(_context).extension<CustomColorScheme>()!.textFieldLabelColor!;
  Color get inputFieldBorder => Theme.of(_context).extension<CustomColorScheme>()!.inputFieldBorderColor!;
  Color get mainGreen => Theme.of(_context).extension<CustomColorScheme>()!.mainGreenColor!;
  Color get inputFieldTextColor => Theme.of(_context).extension<CustomColorScheme>()!.inputFieldTextColor!;
  Color get eventLocationTextColor => Theme.of(_context).extension<CustomColorScheme>()!.eventLocationTextColor!;
  Color get onboardingDescColor => Theme.of(_context).extension<CustomColorScheme>()!.onboardingDescColor!;
  Color get onboardingSkipColor => Theme.of(_context).extension<CustomColorScheme>()!.onboardingSkipColor!;
  Color get onboardingIndicatorColor => Theme.of(_context).extension<CustomColorScheme>()!.onboardingIndicatorColor!;
  Color get circularBackButtonColor => Theme.of(_context).extension<CustomColorScheme>()!.circularBackButtonColor!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  const CustomColorScheme({
    required this.primary,
    required this.primaryText,
    required this.backgroundEndGradient,
    required this.backgroundStartGradient,
    required this.editProfileBackground,
    required this.textFieldLabelColor,
    required this.inputFieldBorderColor,
    required this.mainGreenColor,
    required this.inputFieldTextColor,
    required this.eventLocationTextColor,
    required this.onboardingDescColor,
    required this.onboardingSkipColor,
    required this.onboardingIndicatorColor,
    required this.circularBackButtonColor,
  });

  const CustomColorScheme.classic()
    : primary = Colors.blue,
      primaryText = const Color(0xff13123A),
      textFieldLabelColor = const Color(0xff7A7A90),
      backgroundEndGradient = const Color(0xFF000000),
      backgroundStartGradient = const Color(0xFF403e3e),
      editProfileBackground = const Color(0xFFEEEEF1),
      inputFieldBorderColor = const Color(0xFFE0E0E6),
      mainGreenColor = const Color(0xFF5A8E22),
      inputFieldTextColor = const Color(0xFF13123A),
      eventLocationTextColor = const Color(0xFF7A7A90),
      onboardingDescColor = const Color(0xFF414141),
      onboardingSkipColor = const Color(0xFF101010),
      onboardingIndicatorColor = const Color.fromRGBO(88, 88, 88, 1),
      circularBackButtonColor = const Color(0xFFEEEEE1);

  final Color? primary;
  final Color? primaryText;
  final Color? textFieldLabelColor;
  final Color? backgroundEndGradient;
  final Color? backgroundStartGradient;
  final Color? editProfileBackground;
  final Color? inputFieldBorderColor;
  final Color? mainGreenColor;
  final Color? inputFieldTextColor;
  final Color? eventLocationTextColor;
  final Color? onboardingDescColor;
  final Color? onboardingSkipColor;
  final Color? onboardingIndicatorColor;
  final Color? circularBackButtonColor;

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? primaryText,
    Color? backgroundEndGradient,
    Color? backgroundStartGradient,
    Color? editProfileBackground,
    Color? textFieldLabelColor,
    Color? inputFieldBorderColor,
    Color? mainGreenColor,
    Color? inputFieldTextColor,
    Color? eventLocationTextColor,
    Color? onboardingDescColor,
    Color? onboardingSkipColor,
    Color? onboardingIndicatorColor,
    Color? circularBackButtonColor,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      primaryText: primaryText ?? this.primaryText,
      backgroundEndGradient: backgroundEndGradient ?? this.backgroundEndGradient,
      backgroundStartGradient: backgroundStartGradient ?? this.backgroundStartGradient,
      editProfileBackground: editProfileBackground ?? this.editProfileBackground,
      textFieldLabelColor: textFieldLabelColor ?? this.textFieldLabelColor,
      inputFieldBorderColor: inputFieldBorderColor ?? this.inputFieldBorderColor,
      mainGreenColor: mainGreenColor ?? this.mainGreenColor,
      inputFieldTextColor: inputFieldTextColor ?? this.inputFieldTextColor,
      eventLocationTextColor: eventLocationTextColor ?? this.eventLocationTextColor,
      onboardingDescColor: onboardingDescColor ?? this.onboardingDescColor,
      onboardingSkipColor: onboardingSkipColor ?? this.onboardingSkipColor,
      onboardingIndicatorColor: onboardingIndicatorColor ?? this.onboardingIndicatorColor,
      circularBackButtonColor: circularBackButtonColor ?? this.circularBackButtonColor,
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
      editProfileBackground: Color.lerp(editProfileBackground, other.editProfileBackground, t),
      textFieldLabelColor: Color.lerp(textFieldLabelColor, other.textFieldLabelColor, t),
      inputFieldBorderColor: Color.lerp(inputFieldBorderColor, other.inputFieldBorderColor, t),
      mainGreenColor: Color.lerp(mainGreenColor, other.mainGreenColor, t),
      inputFieldTextColor: Color.lerp(inputFieldTextColor, other.inputFieldTextColor, t),
      eventLocationTextColor: Color.lerp(eventLocationTextColor, other.eventLocationTextColor, t),
      onboardingDescColor: Color.lerp(onboardingDescColor, other.onboardingDescColor, t),
      onboardingSkipColor: Color.lerp(onboardingSkipColor, other.onboardingSkipColor, t),
      onboardingIndicatorColor: Color.lerp(onboardingIndicatorColor, other.onboardingIndicatorColor, t),
      circularBackButtonColor: Color.lerp(circularBackButtonColor, other.circularBackButtonColor, t),
    );
  }
}
