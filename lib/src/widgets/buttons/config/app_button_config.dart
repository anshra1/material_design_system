// lib/buttons/app_button_config.dart

import 'package:flutter/material.dart';

/// Defines the style properties for custom buttons.
/// This is a pure Dart class with no Flutter dependencies beyond core types.
@immutable
class AppButtonConfig {
  const AppButtonConfig({
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    this.elevation,
    this.padding,
    this.textStyle,
    this.side,
    this.shape,
    this.iconGap,
    this.maximumSize,
    this.minimumSize, // Added minimumSize property
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? overlayColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final BorderSide? side;
  final ShapeBorder? shape;
  final Size? maximumSize;
  final Size? minimumSize; // Added minimumSize property

  /// Horizontal space between icon and text when both are present
  final double? iconGap;

  /// Creates a new config by overriding existing properties.
  AppButtonConfig copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    BorderSide? side,
    ShapeBorder? shape,
    double? iconGap,
    Size? maximumSize,
    Size? minimumSize, // Added minimumSize parameter
  }) {
    return AppButtonConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      overlayColor: overlayColor ?? this.overlayColor,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      side: side ?? this.side,
      shape: shape ?? this.shape,
      iconGap: iconGap ?? this.iconGap,
      maximumSize: maximumSize ?? this.maximumSize,
      minimumSize: minimumSize ?? this.minimumSize, // Added minimumSize assignment
    );
  }
}
