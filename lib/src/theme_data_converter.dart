import 'package:flutter/material.dart';
import 'package:material_design_system/extensions/extended_colors.dart';
import 'package:material_design_system/tokens/material_base/system_tokens.dart';

/// A utility class to convert [SystemTokens] into a Flutter [ThemeData] object.
class ThemeDataConverter {
  /// Converts the given [SystemTokens] into a [ThemeData] object.
  static ThemeData toThemeData(SystemTokens tokens) {
    final colorScheme = ColorScheme(
      brightness: tokens.background.computeLuminance() > 0.5
          ? Brightness.light
          : Brightness.dark,
      primary: tokens.primary,
      onPrimary: tokens.onPrimary,
      primaryContainer: tokens.primaryContainer,
      onPrimaryContainer: tokens.onPrimaryContainer,
      secondary: tokens.secondary,
      onSecondary: tokens.onSecondary,
      secondaryContainer: tokens.secondaryContainer,
      onSecondaryContainer: tokens.onSecondaryContainer,
      tertiary: tokens.tertiary,
      onTertiary: tokens.onTertiary,
      tertiaryContainer: tokens.tertiaryContainer,
      onTertiaryContainer: tokens.onTertiaryContainer,
      error: tokens.error,
      onError: tokens.onError,
      errorContainer: tokens.errorContainer,
      onErrorContainer: tokens.onErrorContainer,
      background: tokens.background,
      onBackground: tokens.onBackground,
      surface: tokens.surface,
      onSurface: tokens.onSurface,
      surfaceVariant: tokens.surfaceVariant,
      onSurfaceVariant: tokens.onSurfaceVariant,
      outline: tokens.outline,
      outlineVariant: tokens.outlineVariant,
      scrim: tokens.scrim,
      inverseSurface: tokens.inverseSurface,
      onInverseSurface: tokens.onInverseSurface,
      surfaceTint: tokens.surfaceTint,
    );

    final extendedColors = ExtendedColors(
      success: tokens.success,
      onSuccess: tokens.onSuccess,
      successContainer: tokens.successContainer,
      onSuccessContainer: tokens.onSuccessContainer,
      warning: tokens.warning,
      onWarning: tokens.onWarning,
      warningContainer: tokens.warningContainer,
      onWarningContainer: tokens.onWarningContainer,
      info: tokens.info,
      onInfo: tokens.onInfo,
      infoContainer: tokens.infoContainer,
      onInfoContainer: tokens.onInfoContainer,
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        extendedColors,
      ],
    );
  }
}