// lib/buttons/app_button_themes.dart

import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';
import 'package:material_design_system/theme/md_theme.dart';

/// Defines the standard button appearances for the app.
/// Connects the design system (MdTheme) to the button config schema.
class AppButtonThemes {
  /// The standard style for a primary, high-emphasis action.
  static AppButtonConfig primary(BuildContext context) {
    final md = MdTheme.of(context);

    return AppButtonConfig(
      backgroundColor: md.sys.primary,
      foregroundColor: md.sys.onPrimary,
      overlayColor: md.sys.onPrimary.withValues(alpha: 0.12),
      elevation: md.elevation.level1,

      textStyle: md.typ.getLabelLarge(context),
      shape: md.sha.shapeSmall as OutlinedBorder?,
      iconGap: md.space.small(context),
      minimumSize: Size(250, 48), // Added minimum size
      maximumSize: Size(250, 48), // Allow button to expand beyond minimum size
    );
  }

  /// The style for a secondary, medium-emphasis action.
  static AppButtonConfig secondary(BuildContext context) {
    final md = MdTheme.of(context);

    // Using system colors as a fallback for now.
    return AppButtonConfig(
      backgroundColor: md.sys.secondaryContainer,
      foregroundColor: md.sys.onSecondaryContainer,
      overlayColor: md.sys.onSecondaryContainer.withValues(alpha: 0.12),
      elevation: md.elevation.level0,
      padding: EdgeInsets.symmetric(
        horizontal: md.space.medium(context),
        vertical: md.space.small(context),
      ),
      textStyle: md.typ.getLabelLarge(context),
      shape: md.sha.shapeSmall as OutlinedBorder?,
      iconGap: md.space.small(context),
      minimumSize: Size(250, 48), // Added minimum size
      maximumSize: Size(250, 48), // Fixed maximum size
    );
  }
}
