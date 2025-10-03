import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_themes.dart';

/// Defines the position of the icon relative to the text within the button.
enum ButtonIconPosition {
  /// The icon is placed to the left of the text.
  left,

  /// The icon is placed to the right of the text.
  right,
}

/// A reusable, configuration-driven primary button that supports an icon.
class PrimaryButtonWithIcon extends StatelessWidget {
  const PrimaryButtonWithIcon({
    required this.onPressed,
    required this.text,
    super.key,
    this.icon,
    this.iconPosition = ButtonIconPosition.left,
    this.tooltip,
    this.overrideConfig,
  });

  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final ButtonIconPosition iconPosition;
  final String? tooltip;
  final AppButtonConfig? overrideConfig;

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
        'PrimaryButtonWithIcon received a shape of type ${finalShape.runtimeType}, which is not an OutlinedBorder. '
        'ElevatedButton requires an OutlinedBorder. For other shapes, consider creating a dedicated component.',
      );
    }

    // 4. Build the button content.
    final iconGap = finalConfig.iconGap ?? 8.0;
    final textWidget = Text(text); // ButtonStyle will handle the text style
    final children = <Widget>[];
    if (icon != null) {
      final iconSpacing = SizedBox(width: iconGap);
      if (iconPosition == ButtonIconPosition.left) {
        children.addAll([icon!, iconSpacing, textWidget]);
      } else {
        children.addAll([textWidget, iconSpacing, icon!]);
      }
    } else {
      children.add(textWidget);
    }

    // 5. Render the final button using the resolved configuration.
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
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );

    // 6. Apply tooltip if provided.
    if (tooltip != null) {
      return Tooltip(message: tooltip, child: button);
    }

    return button;
  }
}
