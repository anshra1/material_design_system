import 'package:flutter/material.dart';
import 'package:material_design_system/theme/md_theme.dart';
import 'package:material_design_system/tokens/system_tokens.dart';

/// An [MdTheme] implementation that holds a single [SystemTokens] object.
///
/// This is used for applications or parts of applications that do not change
/// based on the device's brightness setting.
@immutable
class SingleMdTheme extends MdTheme {
  /// The single set of tokens to be used regardless of brightness.
  final SystemTokens theme;

  /// Creates a new [SingleMdTheme].
  const SingleMdTheme({required this.theme});

  @override
  SystemTokens resolve(BuildContext context) {
    // Always returns the single theme, regardless of context brightness.
    return theme;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleMdTheme && runtimeType == other.runtimeType && theme == other.theme;

  @override
  int get hashCode => theme.hashCode;
}
