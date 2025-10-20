import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

mixin AppTheme {
  static const _lightFillColor = Color(0xFF303030);

  static final Color _lightFocusColor = _lightFillColor.withValues(alpha: 0.12);

  static ThemeData darkThemeData = themeData(darkColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) => ThemeData(
    useMaterial3: false,
    appBarTheme: appBarThemeData(colorScheme),
    canvasColor: colorScheme.surface,
    colorScheme: colorScheme,
    disabledColor: colorScheme.tertiaryContainer,
    dividerColor: colorScheme.tertiaryContainer,
    buttonTheme: buttonThemeData(colorScheme),
    elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
    outlinedButtonTheme: outlinedButtonThemeData(colorScheme),
    focusColor: focusColor,
    fontFamily: 'Poppins',
    highlightColor: colorScheme.secondary.withValues(alpha: 0.32),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    inputDecorationTheme: inputDecorationTheme(colorScheme),
    primaryColor: colorScheme.primary,
    primaryColorLight: colorScheme.primaryContainer,
    scaffoldBackgroundColor: colorScheme.surface,
    primaryColorDark: colorScheme.secondary,
    textTheme: const TextTheme(
      displaySmall: AppTextStyles.displaySmall,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleSmall: AppTextStyles.titleSmall1,
      bodyLarge: AppTextStyles.bodyLarge1,
      bodyMedium: AppTextStyles.bodyMedium1,
      bodySmall: AppTextStyles.bodySmall1,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium1,
      labelSmall: AppTextStyles.labelSmall,
    ),
    splashColor: AppColors.green50.withValues(alpha: 0.32),
  );

  static ColorScheme get darkColorScheme => const ColorScheme(
    brightness: Brightness.dark,
    error: AppColors.red300,
    tertiary: AppColors.neutral400,
    tertiaryContainer: AppColors.neutral200,
    onError: AppColors.neutral0,
    onPrimary: AppColors.neutral0,
    onSecondary: AppColors.neutral0,
    onSurface: AppColors.neutral0,
    primary: AppColors.green400,
    primaryContainer: AppColors.green200,
    secondary: AppColors.blue400,
    secondaryContainer: AppColors.blue200,
    surface: AppColors.neutral600,
    surfaceContainerHighest: AppColors.neutral400,
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colorScheme) => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.tertiary,
      disabledBackgroundColor: AppColors.neutral100,
      animationDuration: const Duration(milliseconds: 200),
      elevation: 0,
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonThemeData(ColorScheme colorScheme) => OutlinedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled) ? colorScheme.tertiary : colorScheme.primary,
      ),
      backgroundColor: WidgetStateProperty.all(colorScheme.onPrimary),
      side: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? BorderSide(color: colorScheme.tertiary)
            : BorderSide(color: colorScheme.primary),
      ),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    ),
  );

  static AppBarTheme appBarThemeData(ColorScheme colorScheme) => AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 32),
    actionsIconTheme: IconThemeData(color: colorScheme.onPrimary, size: 32),
    backgroundColor: colorScheme.secondary,
    toolbarTextStyle: AppTextStyles.bodyMedium1.copyWith(fontWeight: FontWeight.w700, color: colorScheme.onPrimary),
    titleTextStyle: AppTextStyles.bodyMedium1.copyWith(fontWeight: FontWeight.w700, color: colorScheme.onPrimary),
  );

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) => InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.tertiary),
      borderRadius: BorderRadius.circular(16),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.tertiary),
      borderRadius: BorderRadius.circular(16),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.tertiaryContainer),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.secondaryContainer),
      borderRadius: BorderRadius.circular(16),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.error),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.error),
      borderRadius: BorderRadius.circular(16),
    ),
    hintStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(color: colorScheme.tertiaryContainer);
      }
      if (states.contains(WidgetState.error)) {
        return TextStyle(color: colorScheme.error);
      }
      return TextStyle(color: colorScheme.tertiary);
    }),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(color: colorScheme.tertiaryContainer);
      }
      if (states.contains(WidgetState.error)) {
        return TextStyle(color: colorScheme.error);
      }
      if (states.contains(WidgetState.selected) || states.contains(WidgetState.focused)) {
        return TextStyle(color: colorScheme.secondary);
      }
      return TextStyle(color: colorScheme.tertiary);
    }),
    labelStyle: WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(color: colorScheme.tertiaryContainer);
      }
      if (states.contains(WidgetState.error)) {
        return TextStyle(color: colorScheme.error);
      }
      if (states.contains(WidgetState.selected) || states.contains(WidgetState.focused)) {
        return TextStyle(color: colorScheme.secondary);
      }
      return TextStyle(color: colorScheme.tertiary);
    }),
    alignLabelWithHint: true,
  );

  static ButtonThemeData buttonThemeData(ColorScheme colorScheme) => ButtonThemeData(
    colorScheme: ColorScheme.light(primary: colorScheme.secondary),
    buttonColor: colorScheme.secondary,
    splashColor: colorScheme.secondaryContainer,
    disabledColor: colorScheme.tertiary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
