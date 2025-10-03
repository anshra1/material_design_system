import 'package:flutter/material.dart';
import 'package:material_design_system/theme/md_theme_token.dart';
import 'package:material_design_system/tokens/system_tokens.dart';

/// An [InheritedWidget] that provides the design system's tokens to the widget
/// tree.
/// To access the tokens, use `MdThemeWidget.of(context)`.
class MdThemeWidget extends InheritedWidget {
  const MdThemeWidget({super.key, required this.data, required super.child});

  /// The theme data, which can be a single theme or a light/dark pair.
  final MdThemeToken data;

  /// Returns the resolved [SystemTokens] for the current build context.
  ///
  /// This is the primary way to access the design system's tokens.
  /// For example: `MdThemeWidget.of(context).primary`.
  static SystemTokens of(BuildContext context) {
    final mdThemeWidget = context.dependOnInheritedWidgetOfExactType<MdThemeWidget>();
    if (mdThemeWidget == null) {
      throw FlutterError(
        'MdThemeWidget not found in context. Make sure to wrap your app in a MdThemeWidget.',
      );
    }
    return mdThemeWidget.data.resolve(context);
  }

  @override
  bool updateShouldNotify(MdThemeWidget oldWidget) {
    return data != oldWidget.data;
  }
}
