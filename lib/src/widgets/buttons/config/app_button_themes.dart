// lib/buttons/app_button_themes.dart

import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';

/// Defines the standard button appearances for the app.
/// Connects the design system (ThemeData) to the button config schema.
class AppButtonThemes {
  /// The standard style for a primary, high-emphasis action.
  static AppButtonConfig primary(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppButtonConfig(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      overlayColor: colorScheme.onPrimary.withOpacity(0.12),
      elevation: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: theme.textTheme.labelLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      iconGap: 8.0,
    );
  }

  /// The style for a secondary, medium-emphasis action.
  static AppButtonConfig secondary(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppButtonConfig(
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
      overlayColor: colorScheme.onSecondaryContainer.withOpacity(0.12),
      elevation: 0.0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: theme.textTheme.labelLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      iconGap: 8.0,
    );
  }
}
