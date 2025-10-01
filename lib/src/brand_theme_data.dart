import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_system/src/theme_generator.dart';
import 'package:material_design_system/src/tokens.dart';

/// Holds the generated [SystemTokens] for both light and dark themes.
@immutable
class BrandThemeData {
  const BrandThemeData({required this.light, required this.dark});

  /// Generates a [BrandThemeData] from a set of [SeedColors].
  factory BrandThemeData.fromSeeds(SeedColors seeds) {
    return BrandThemeData(
      light: ThemeGenerator.generate(seeds, Brightness.light),
      dark: ThemeGenerator.generate(seeds, Brightness.dark),
    );
  }

  final SystemTokens light;
  final SystemTokens dark;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandThemeData &&
          runtimeType == other.runtimeType &&
          light == other.light &&
          dark == other.dark;

  @override
  int get hashCode => light.hashCode ^ dark.hashCode;
}
