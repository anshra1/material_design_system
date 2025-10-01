import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// The 6 immutable seed colors that serve as the foundation for all other tokens.
/// These are the single source of truth for the entire design system.
class ReferenceTokens extends Equatable {
  /// The primary color of the brand
  final Color primary;

  /// The secondary color of the brand
  final Color secondary;

  /// The tertiary color of the brand (accent/supporting)
  final Color tertiary;

  /// The neutral color for backgrounds and surfaces
  final Color neutral;

  /// The variant of neutral color with subtle hue variation
  final Color neutralVariant;

  /// The error color for error states and feedback
  final Color error;

  /// Creates a new [ReferenceTokens] instance with the specified seed colors.
  ///
  /// These 6 colors are the immutable foundation of the entire design system.
  const ReferenceTokens({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
    required this.error,
  });

  /// Creates a copy of this [ReferenceTokens] but with the given fields replaced.
  ReferenceTokens copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? neutral,
    Color? neutralVariant,
    Color? error,
  }) {
    return ReferenceTokens(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      neutral: neutral ?? this.neutral,
      neutralVariant: neutralVariant ?? this.neutralVariant,
      error: error ?? this.error,
    );
  }

  /// Creates a [ReferenceTokens] from a JSON object.
  factory ReferenceTokens.fromJson(Map<String, dynamic> json) {
    return ReferenceTokens(
      primary: _colorFromHex(json['primary']),
      secondary: _colorFromHex(json['secondary']),
      tertiary: _colorFromHex(json['tertiary']),
      neutral: _colorFromHex(json['neutral']),
      neutralVariant: _colorFromHex(json['neutralVariant']),
      error: _colorFromHex(json['error']),
    );
  }

  /// Converts this [ReferenceTokens] to a JSON object.
  Map<String, dynamic> toJson() {
    String rgbHex(Color c) {
      final int argb = c.toARGB32();
      final String hex8 = argb.toRadixString(16).padLeft(8, '0');
      return '#${hex8.substring(2)}';
    }

    return {
      'primary': rgbHex(primary),
      'secondary': rgbHex(secondary),
      'tertiary': rgbHex(tertiary),
      'neutral': rgbHex(neutral),
      'neutralVariant': rgbHex(neutralVariant),
      'error': rgbHex(error),
    };
  }

  static Color _colorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  @override
  List<Object?> get props => [
    primary,
    secondary,
    tertiary,
    neutral,
    neutralVariant,
    error,
  ];

  @override
  String toString() {
    return 'ReferenceTokens('
        'primary: $primary, '
        'secondary: $secondary, '
        'tertiary: $tertiary, '
        'neutral: $neutral, '
        'neutralVariant: $neutralVariant, '
        'error: $error'
        ')';
  }
}
