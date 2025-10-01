import 'package:flutter/material.dart';
import 'package:material_design_system/src/brand_theme_data.dart';
import 'package:material_design_system/src/tokens.dart';

/// An [InheritedWidget] that provides the design system's tokens to the widget
/// tree.
class BrandTheme extends InheritedWidget {
  const BrandTheme({super.key, required this.data, required super.child});

  /// The design system's token data for light and dark themes.
  final BrandThemeData data;

  /// Returns the [SystemTokens] for the current theme brightness.
  ///
  /// This is the primary way to access the design system's tokens.
  /// For example: `BrandTheme.of(context).primary`.
  static SystemTokens of(BuildContext context) {
    final brandTheme = context.dependOnInheritedWidgetOfExactType<BrandTheme>();
    if (brandTheme == null) {
      throw FlutterError(
        'BrandTheme not found in context. Make sure to wrap your app in a '
        'BrandTheme widget.',
      );
    }
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? brandTheme.data.light : brandTheme.data.dark;
  }

  @override
  bool updateShouldNotify(BrandTheme oldWidget) {
    return data != oldWidget.data;
  }
}
