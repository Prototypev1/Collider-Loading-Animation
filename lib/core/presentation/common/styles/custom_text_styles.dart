import 'package:flutter/material.dart';

class CustomTextStyles {
  const CustomTextStyles.of(BuildContext context) : _context = context;
  final BuildContext _context;

  TextStyle get regular14 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular14!;
  TextStyle get regular16 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular16!;
  TextStyle get regular18 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular18!;
  TextStyle get regular30 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular30!;
  TextStyle get medium10 => Theme.of(_context).extension<CustomTextStyleScheme>()!.medium10!;
  TextStyle get medium12 => Theme.of(_context).extension<CustomTextStyleScheme>()!.medium12!;
  TextStyle get medium14 => Theme.of(_context).extension<CustomTextStyleScheme>()!.medium14!;
  TextStyle get medium16 => Theme.of(_context).extension<CustomTextStyleScheme>()!.medium16!;
  TextStyle get medium18 => Theme.of(_context).extension<CustomTextStyleScheme>()!.medium18!;
  TextStyle get semiBold14 => Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold14!;
  TextStyle get semiBold16 => Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold16!;
  TextStyle get semiBold18 => Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold18!;
  TextStyle get semiBold24 => Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold24!;
  TextStyle get semiBold28 => Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold28!;
  TextStyle get bold12 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold12!;
  TextStyle get bold14 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold14!;
  TextStyle get bold15 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold15!;
  TextStyle get bold16 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold16!;
  TextStyle get bold18 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold18!;
  TextStyle get bold30 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold30!;
}

@immutable
class CustomTextStyleScheme extends ThemeExtension<CustomTextStyleScheme> {
  const CustomTextStyleScheme({
    required this.regular14,
    required this.regular16,
    required this.regular18,
    required this.regular30,
    required this.medium10,
    required this.medium12,
    required this.medium14,
    required this.medium16,
    required this.medium18,
    required this.semiBold14,
    required this.semiBold16,
    required this.semiBold18,
    required this.semiBold24,
    required this.semiBold28,
    required this.bold12,
    required this.bold14,
    required this.bold15,
    required this.bold16,
    required this.bold18,
    required this.bold30,
  });

  factory CustomTextStyleScheme.fromPrimaryTextColor({required Color primaryTextColor}) {
    const courierRegular = 'CourierPrime-Regular.ttf';
    const courierBold = 'CourierPrime-Bold.ttf';

    return CustomTextStyleScheme(
      regular14: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      regular16: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      regular18: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      regular30: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 30,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      medium10: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      medium12: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      medium14: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      medium16: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      medium18: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      semiBold14: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
      semiBold16: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
      semiBold18: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
      semiBold24: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
      semiBold28: TextStyle(
        fontFamily: courierRegular,
        color: primaryTextColor,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
      bold12: TextStyle(
        fontFamily: courierBold,
        color: primaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      ),
      bold14: TextStyle(
        fontFamily: courierBold,
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      ),
      bold15: TextStyle(
        fontFamily: courierBold,
        color: primaryTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      ),
      bold16: TextStyle(
        fontFamily: courierBold,
        color: primaryTextColor,
        fontSize: 16,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600,
      ),
      bold18: TextStyle(
        fontFamily: courierBold,
        color: primaryTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      ),
      bold30: TextStyle(
        height: 1.2,
        fontFamily: courierBold,
        color: primaryTextColor,
        fontSize: 30,
        fontWeight: FontWeight.w200,
        decoration: TextDecoration.none,
        letterSpacing: 1.0,
      ),
    );
  }

  final TextStyle? regular14;
  final TextStyle? regular16;
  final TextStyle? regular18;
  final TextStyle? regular30;
  final TextStyle? medium10;
  final TextStyle? medium12;
  final TextStyle? medium14;
  final TextStyle? medium16;
  final TextStyle? medium18;
  final TextStyle? semiBold14;
  final TextStyle? semiBold16;
  final TextStyle? semiBold18;
  final TextStyle? semiBold24;
  final TextStyle? semiBold28;
  final TextStyle? bold12;
  final TextStyle? bold14;
  final TextStyle? bold15;
  final TextStyle? bold16;
  final TextStyle? bold18;
  final TextStyle? bold30;

  @override
  CustomTextStyleScheme copyWith({
    TextStyle? regular10,
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? regular18,
    TextStyle? regular30,
    TextStyle? medium10,
    TextStyle? medium12,
    TextStyle? medium14,
    TextStyle? medium16,
    TextStyle? medium18,
    TextStyle? semiBold14,
    TextStyle? semiBold16,
    TextStyle? semiBold18,
    TextStyle? semiBold24,
    TextStyle? semiBold28,
    TextStyle? bold12,
    TextStyle? bold14,
    TextStyle? bold15,
    TextStyle? bold16,
    TextStyle? bold18,
    TextStyle? bold30,
  }) {
    return CustomTextStyleScheme(
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      regular18: regular18 ?? this.regular18,
      regular30: regular30 ?? this.regular30,
      medium10: medium10 ?? this.medium10,
      medium12: medium12 ?? this.medium12,
      medium14: medium14 ?? this.medium14,
      medium16: medium16 ?? this.medium16,
      medium18: medium18 ?? this.medium18,
      semiBold14: semiBold14 ?? this.semiBold14,
      semiBold16: semiBold16 ?? this.semiBold16,
      semiBold18: semiBold18 ?? this.semiBold18,
      semiBold24: semiBold24 ?? this.semiBold24,
      semiBold28: semiBold28 ?? this.semiBold28,
      bold12: bold12 ?? this.bold12,
      bold14: bold14 ?? this.bold14,
      bold15: bold15 ?? this.bold15,
      bold16: bold16 ?? this.bold16,
      bold18: bold18 ?? this.bold18,
      bold30: bold30 ?? this.bold30,
    );
  }

  @override
  CustomTextStyleScheme lerp(ThemeExtension<CustomTextStyleScheme>? other, double t) {
    if (other is! CustomTextStyleScheme) {
      return this;
    }
    return CustomTextStyleScheme(
      regular14: TextStyle.lerp(regular14, other.regular14, t),
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      regular18: TextStyle.lerp(regular18, other.regular18, t),
      regular30: TextStyle.lerp(regular30, other.regular30, t),
      medium10: TextStyle.lerp(medium10, other.medium10, t),
      medium12: TextStyle.lerp(medium12, other.medium12, t),
      medium14: TextStyle.lerp(medium14, other.medium14, t),
      medium16: TextStyle.lerp(medium16, other.medium16, t),
      medium18: TextStyle.lerp(medium18, other.medium18, t),
      semiBold14: TextStyle.lerp(semiBold14, other.semiBold14, t),
      semiBold16: TextStyle.lerp(semiBold16, other.semiBold16, t),
      semiBold18: TextStyle.lerp(semiBold18, other.semiBold18, t),
      semiBold24: TextStyle.lerp(semiBold24, other.semiBold24, t),
      semiBold28: TextStyle.lerp(semiBold28, other.semiBold28, t),
      bold12: TextStyle.lerp(bold12, other.bold12, t),
      bold14: TextStyle.lerp(bold14, other.bold14, t),
      bold15: TextStyle.lerp(bold15, other.bold15, t),
      bold16: TextStyle.lerp(bold16, other.bold16, t),
      bold18: TextStyle.lerp(bold18, other.bold18, t),
      bold30: TextStyle.lerp(bold30, other.bold30, t),
    );
  }
}
