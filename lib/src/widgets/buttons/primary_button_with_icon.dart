import 'package:flutter/material.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_config.dart';
import 'package:material_design_system/src/widgets/buttons/config/app_button_themes.dart';

/// Defines the position of the icon relative to the text within the button.
enum ButtonIconPosition {
  /// The icon is placed to the left of the text.
  left,

  /// The icon is placed to the right of the text.
  right,

  /// No icon is displayed.
  none,
}

/// A highly reusable, customizable, and production-ready primary action button
/// adhering to the application's design system.
///
/// It correctly handles sizing (wrapping content by default) and uses modern
/// [ElevatedButton.styleFrom] for cleaner styling.

class PrimaryButtonWithIcon extends StatelessWidget {
  const PrimaryButtonWithIcon({
    required this.onPressed,
    required this.text,
    this.tooltipText = '',
    this.icon,
    this.iconPosition = ButtonIconPosition.none,
    this.size, // Size is now only used for explicit constraining
    this.overrideConfig,
    super.key,
  });

  /// The callback function executed when the button is pressed.
  final VoidCallback onPressed;

  /// The main text displayed within the button.
  final String text;

  /// Optional text displayed when hovering over the button.
  final String tooltipText;

  /// Optional widget displayed as the button's icon (e.g., an [Icon] widget).
  final Widget? icon;

  /// Defines the placement of the [icon] relative to the [text]. Defaults to [ButtonIconPosition.none].
  final ButtonIconPosition iconPosition;

  /// Explicit size constraint for the button. If provided, the button will take this size;
  /// otherwise, it will wrap its content.
  final Size? size;

  /// Optional config that can override theme-derived defaults for this button.
  ///
  /// NOTE: Current precedence is explicit props > overrideConfig > theme base.
  final AppButtonConfig? overrideConfig;

  /// Private method to build the button's content [Row].
  List<Widget> _buildChildren(TextStyle effectiveTextStyle, double iconGap) {
    final textWidget = Text(text, style: effectiveTextStyle);

    if (icon == null) {
      return [textWidget];
    }

    final children = <Widget>[];
    final iconSpacing = SizedBox(width: iconGap);

    if (iconPosition == ButtonIconPosition.left) {
      children.addAll([icon!, iconSpacing, textWidget]);
    } else if (iconPosition == ButtonIconPosition.right) {
      children.addAll([textWidget, iconSpacing, icon!]);
    } else {
      children.add(textWidget);
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 1) Get base config from theme factory
    final baseConfig = AppButtonThemes.primary(context);

    // 2) Merge local overrideConfig (if provided)
    final mergedConfig = overrideConfig != null
        ? baseConfig.copyWith(
            backgroundColor: overrideConfig!.backgroundColor,
            foregroundColor: overrideConfig!.foregroundColor,
            overlayColor: overrideConfig!.overlayColor,
            elevation: overrideConfig!.elevation,
            padding: overrideConfig!.padding,
            textStyle: overrideConfig!.textStyle,
            side: overrideConfig!.side,
            shape: overrideConfig!.shape,
          )
        : baseConfig;

    // 3) Resolve final values with precedence: overrideConfig > theme base
    final effectiveBgColor = mergedConfig.backgroundColor ?? theme.colorScheme.primary;
    final effectiveFgColor = mergedConfig.foregroundColor ?? theme.colorScheme.onPrimary;
    final effectiveOverlayColor = mergedConfig.overlayColor;
    final effectivePadding =
        mergedConfig.padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    final effectiveTextStyle =
        (mergedConfig.textStyle ?? theme.textTheme.labelLarge ?? const TextStyle())
            .copyWith(color: effectiveFgColor);
    final effectiveShape = mergedConfig.shape is OutlinedBorder
        ? mergedConfig.shape as OutlinedBorder?
        : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    final iconGap = mergedConfig.iconGap ?? 8.0;

    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(effectiveBgColor),
      foregroundColor: WidgetStateProperty.all(effectiveFgColor),
      overlayColor: effectiveOverlayColor != null
          ? WidgetStateProperty.all(effectiveOverlayColor)
          : null,
      elevation: mergedConfig.elevation != null
          ? WidgetStateProperty.all(mergedConfig.elevation)
          : null,
      padding: WidgetStateProperty.all(effectivePadding),
      textStyle: WidgetStateProperty.all(effectiveTextStyle),
      shape: WidgetStateProperty.all(effectiveShape),
      side: mergedConfig.side != null ? WidgetStateProperty.all(mergedConfig.side) : null,
    );

    final buttonWidget = ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      // Use MainAxisSize.min for a button that wraps content
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildChildren(effectiveTextStyle, iconGap),
      ),
    );

    // Conditionally wrap with SizedBox only if size is provided
    Widget finalWidget = buttonWidget;
    if (size != null) {
      finalWidget = SizedBox.fromSize(size: size, child: buttonWidget);
    }

    return Tooltip(message: tooltipText, child: finalWidget);
  }
}
