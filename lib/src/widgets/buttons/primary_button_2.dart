import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_themes.dart';

/// The public-facing widget for a primary button.
/// It handles its own configuration lookup and rendering.
class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonConfig? overrideConfig;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.overrideConfig,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Get the base configuration from the theme factory.
    final baseConfig = AppButtonThemes.primary(context);

    // 2. Apply any local overrides provided by the developer.
    final finalConfig = overrideConfig != null
        ? baseConfig.copyWith(
            backgroundColor: overrideConfig!.backgroundColor,
            elevation: overrideConfig!.elevation,
            padding: overrideConfig!.padding,
            // ... copy any other properties you want to allow overriding
          )
        : baseConfig;

    // 3. Render the final button using the resolved configuration.
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(finalConfig.backgroundColor),
        foregroundColor: WidgetStateProperty.all(finalConfig.foregroundColor),
        overlayColor: WidgetStateProperty.all(finalConfig.overlayColor),
        elevation: WidgetStateProperty.all(finalConfig.elevation),
        padding: WidgetStateProperty.all(finalConfig.padding),
        textStyle: WidgetStateProperty.all(finalConfig.textStyle),
        shape: WidgetStateProperty.all(finalConfig.shape as OutlinedBorder?),
      ),
      child: child,
    );
  }
}
