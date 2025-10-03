// lib/buttons/app_button_themes.dart

import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';
import 'package:material_design_system/tokens/base_token/elevation_tokens.dart';
import 'package:material_design_system/tokens/base_token/shape_tokens.dart';
import 'package:material_design_system/tokens/base_token/spacing_tokens.dart';

/// Defines the standard button appearances for the app.
/// Connects the design system (ThemeData) to the button config schema.
class AppButtonThemes {
  // Assuming default tokens are used. In a real app, these would likely
  // come from a ThemeExtension or Provider.
  static const _shapes = ShapeTokens();
  static const _elevation = ElevationTokens();
  static const _spacing = SpacingTokens();

  /// The standard style for a primary, high-emphasis action.
  static AppButtonConfig primary(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppButtonConfig(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      overlayColor: colorScheme.onPrimary.withOpacity(0.12),
      elevation: _elevation.level1,
      padding: EdgeInsets.symmetric(
        horizontal: _spacing.medium(context),
        vertical: _spacing.small(context),
      ),
      textStyle: theme.textTheme.labelLarge,
      shape: _shapes.shapeSmall as OutlinedBorder?,
      iconGap: _spacing.small(context),
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
      elevation: _elevation.level0,
      padding: EdgeInsets.symmetric(
        horizontal: _spacing.medium(context),
        vertical: _spacing.small(context),
      ),
      textStyle: theme.textTheme.labelLarge,
      shape: _shapes.shapeSmall as OutlinedBorder?,
      iconGap: _spacing.small(context),
    );
  }
}
