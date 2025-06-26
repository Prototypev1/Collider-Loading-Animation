import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class ThemeRepository {
  final _colorScheme = const CustomColorScheme.classic();
  String? _appLogoSvgUrl;

  String? get appLogoSvgUrl => _appLogoSvgUrl;

  ThemeData buildTheme() {
    final textStyleScheme = CustomTextStyleScheme.fromPrimaryTextColor(primaryTextColor: _colorScheme.primaryText!);
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: _colorScheme.background),
      // fontFamily: 'Exo2',
      extensions: <ThemeExtension<dynamic>>[_colorScheme, textStyleScheme],
    );
  }
}
