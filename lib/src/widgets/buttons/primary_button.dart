import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_themes.dart';

/// The public-facing widget for a primary button.
/// It handles its own configuration lookup and rendering.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.overrideConfig,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonConfig? overrideConfig;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    // 1. Get the base configuration from the theme factory.
    final baseConfig = AppButtonThemes.primary(context);

    // 2. Apply any local overrides provided by the developer.
    final finalConfig = overrideConfig != null
        ? baseConfig.copyWith(
            backgroundColor: overrideConfig!.backgroundColor,
            foregroundColor: overrideConfig!.foregroundColor,
            overlayColor: overrideConfig!.overlayColor,
            elevation: overrideConfig!.elevation,
            padding: overrideConfig!.padding,
            textStyle: overrideConfig!.textStyle,
            shape: overrideConfig!.shape,
            side: overrideConfig!.side,
            iconGap: overrideConfig!.iconGap,
          )
        : baseConfig;

    // 3. Validate the shape configuration.
    final finalShape = finalConfig.shape;
    if (finalShape != null && finalShape is! OutlinedBorder) {
      throw ArgumentError(
        'PrimaryButton received a shape of type ${finalShape.runtimeType}, which is not an OutlinedBorder. '
        'ElevatedButton requires an OutlinedBorder. For other shapes, consider creating a dedicated component.',
      );
    }

    // 4. Render the final button using the resolved configuration.
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(finalConfig.backgroundColor),
        foregroundColor: WidgetStateProperty.all(finalConfig.foregroundColor),
        overlayColor: WidgetStateProperty.all(finalConfig.overlayColor),
        elevation: WidgetStateProperty.all(finalConfig.elevation),
        padding: WidgetStateProperty.all(finalConfig.padding),
        textStyle: WidgetStateProperty.all(finalConfig.textStyle),
        shape: WidgetStateProperty.all(finalShape as OutlinedBorder?),
        side: WidgetStateProperty.all(finalConfig.side),
      ),
      child: child,
    );

    // 5. Apply tooltip if provided.
    if (tooltip != null) {
      return Tooltip(message: tooltip, child: button);
    }

    return button;
  }
}
