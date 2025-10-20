import 'package:flutter/widgets.dart';

import 'app_colors.dart';

mixin AppTextStyles {
  static const FontWeight _light = FontWeight.w300;
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _semibold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;
  static const Color _defaultColor = AppColors.neutral0;

  /// [TextStyle.fontSize]: 38, [TextStyle.fontWeight]: 700
  static const TextStyle displaySmall = TextStyle(
    fontSize: 38,
    fontWeight: _bold,
    color: _defaultColor,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 27, [TextStyle.fontWeight]: 600
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 27,
    fontWeight: _semibold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 21, [TextStyle.fontWeight]: 600
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 21,
    fontWeight: _semibold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 18, [TextStyle.fontWeight]: 300
  static const TextStyle titleSmall1 = TextStyle(
    fontSize: 18,
    fontWeight: _light,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 18, [TextStyle.fontWeight]: 600
  static const TextStyle titleSmall2 = TextStyle(
    fontSize: 18,
    fontWeight: _semibold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 18, [TextStyle.fontWeight]: 400
  static const TextStyle bodyLarge1 = TextStyle(
    fontSize: 18,
    fontWeight: _regular,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 18, [TextStyle.fontWeight]: 600
  static const TextStyle bodyLarge2 = TextStyle(
    fontSize: 18,
    fontWeight: _semibold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 18, [TextStyle.fontWeight]: 700
  static const TextStyle bodyLarge3 = TextStyle(
    fontSize: 18,
    fontWeight: _bold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 16, [TextStyle.fontWeight]: 400
  static const TextStyle bodyMedium1 = TextStyle(
    fontSize: 16,
    fontWeight: _regular,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 16, [TextStyle.fontWeight]: 600
  static const TextStyle bodyMedium2 = TextStyle(
    fontSize: 16,
    fontWeight: _semibold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 14, [TextStyle.fontWeight]: 400
  static const TextStyle bodySmall1 = TextStyle(
    fontSize: 14,
    fontWeight: _regular,
    color: _defaultColor,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 14, [TextStyle.fontWeight]: 600
  static const TextStyle bodySmall2 = TextStyle(
    fontSize: 14,
    fontWeight: _semibold,
    color: _defaultColor,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 18, [TextStyle.fontWeight]: 700
  static const TextStyle labelLarge = TextStyle(
    fontSize: 18,
    fontWeight: _bold,
    color: _defaultColor,
    height: 4 / 3,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 12, [TextStyle.fontWeight]: 400
  static const TextStyle labelMedium1 = TextStyle(
    fontSize: 12,
    fontWeight: _regular,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 12, [TextStyle.fontWeight]: 600
  static const TextStyle labelMedium2 = TextStyle(
    fontSize: 12,
    fontWeight: _semibold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 12, [TextStyle.fontWeight]: 700
  static const TextStyle labelMedium3 = TextStyle(
    fontSize: 12,
    fontWeight: _bold,
    color: _defaultColor,
    height: 1.5,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );

  /// [TextStyle.fontSize]: 10, [TextStyle.fontWeight]: 400
  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: _regular,
    color: _defaultColor,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
  );
}
