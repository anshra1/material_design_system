import 'package:flutter/material.dart';
import 'package:material_design_system/tokens/system_tokens.dart';

/// An [MdTheme] implementation that holds a pair of [SystemTokens] for
/// light and dark modes.
@immutable
class MdThemeSet {
  /// The tokens for the light theme.
  final SystemTokens light;

  /// The tokens for the dark theme.
  final SystemTokens dark;

  /// Creates a new [MdThemeSet].
  const MdThemeSet({required this.light, required this.dark});

  SystemTokens resolve(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? light : dark;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdThemeSet &&
          runtimeType == other.runtimeType &&
          light == other.light &&
          dark == other.dark;

  @override
  int get hashCode => light.hashCode ^ dark.hashCode;
}
