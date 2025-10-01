import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_design_system/src/tokens.dart';

/// A class that generates a theme from a set of seed colors.
class ThemeGenerator {
  /// Generates [SystemTokens] from the given [SeedColors] for a specific
  /// [brightness].
  static SystemTokens generate(SeedColors seeds, Brightness brightness) {
    final primaryPalette = TonalPalette.fromHct(Hct.fromInt(seeds.primary.toARGB32()));
    final secondaryPalette = TonalPalette.fromHct(
      Hct.fromInt(seeds.secondary.toARGB32()),
    );
    final tertiaryPalette = TonalPalette.fromHct(Hct.fromInt(seeds.tertiary.toARGB32()));
    final neutralPalette = TonalPalette.fromHct(Hct.fromInt(seeds.neutral.toARGB32()));
    final neutralVariantPalette = TonalPalette.fromHct(
      Hct.fromInt(seeds.neutralVariant.toARGB32()),
    );
    final errorPalette = TonalPalette.fromHct(Hct.fromInt(seeds.error.toARGB32()));

    return brightness == Brightness.light
        ? _generateLight(
            primaryPalette,
            secondaryPalette,
            tertiaryPalette,
            neutralPalette,
            neutralVariantPalette,
            errorPalette,
          )
        : _generateDark(
            primaryPalette,
            secondaryPalette,
            tertiaryPalette,
            neutralPalette,
            neutralVariantPalette,
            errorPalette,
          );
  }

  static SystemTokens _generateLight(
    TonalPalette primaryPalette,
    TonalPalette secondaryPalette,
    TonalPalette tertiaryPalette,
    TonalPalette neutralPalette,
    TonalPalette neutralVariantPalette,
    TonalPalette errorPalette,
  ) {
    return SystemTokens(
      primary: Color(primaryPalette.get(40)),
      onPrimary: Color(primaryPalette.get(100)),
      primaryContainer: Color(primaryPalette.get(90)),
      onPrimaryContainer: Color(primaryPalette.get(10)),
      secondary: Color(secondaryPalette.get(40)),
      onSecondary: Color(secondaryPalette.get(100)),
      secondaryContainer: Color(secondaryPalette.get(90)),
      onSecondaryContainer: Color(secondaryPalette.get(10)),
      tertiary: Color(tertiaryPalette.get(40)),
      onTertiary: Color(tertiaryPalette.get(100)),
      tertiaryContainer: Color(tertiaryPalette.get(90)),
      onTertiaryContainer: Color(tertiaryPalette.get(10)),
      error: Color(errorPalette.get(40)),
      onError: Color(errorPalette.get(100)),
      errorContainer: Color(errorPalette.get(90)),
      onErrorContainer: Color(errorPalette.get(10)),
      background: Color(neutralPalette.get(99)),
      onBackground: Color(neutralPalette.get(10)),
      surface: Color(neutralPalette.get(99)),
      onSurface: Color(neutralPalette.get(10)),
      surfaceVariant: Color(neutralVariantPalette.get(90)),
      onSurfaceVariant: Color(neutralVariantPalette.get(30)),
      outline: Color(neutralVariantPalette.get(50)),
      outlineVariant: Color(neutralVariantPalette.get(80)),
      shadow: Color(neutralPalette.get(0)),
      scrim: Color(neutralPalette.get(0)),
      inverseSurface: Color(neutralPalette.get(20)),
      onInverseSurface: Color(neutralPalette.get(95)),
      inversePrimary: Color(primaryPalette.get(80)),
      surfaceTint: Color(primaryPalette.get(40)),
    );
  }

  static SystemTokens _generateDark(
    TonalPalette primaryPalette,
    TonalPalette secondaryPalette,
    TonalPalette tertiaryPalette,
    TonalPalette neutralPalette,
    TonalPalette neutralVariantPalette,
    TonalPalette errorPalette,
  ) {
    return SystemTokens(
      primary: Color(primaryPalette.get(80)),
      onPrimary: Color(primaryPalette.get(20)),
      primaryContainer: Color(primaryPalette.get(30)),
      onPrimaryContainer: Color(primaryPalette.get(90)),
      secondary: Color(secondaryPalette.get(80)),
      onSecondary: Color(secondaryPalette.get(20)),
      secondaryContainer: Color(secondaryPalette.get(30)),
      onSecondaryContainer: Color(secondaryPalette.get(90)),
      tertiary: Color(tertiaryPalette.get(80)),
      onTertiary: Color(tertiaryPalette.get(20)),
      tertiaryContainer: Color(tertiaryPalette.get(30)),
      onTertiaryContainer: Color(tertiaryPalette.get(90)),
      error: Color(errorPalette.get(80)),
      onError: Color(errorPalette.get(20)),
      errorContainer: Color(errorPalette.get(30)),
      onErrorContainer: Color(errorPalette.get(90)),
      background: Color(neutralPalette.get(10)),
      onBackground: Color(neutralPalette.get(90)),
      surface: Color(neutralPalette.get(10)),
      onSurface: Color(neutralPalette.get(90)),
      surfaceVariant: Color(neutralVariantPalette.get(30)),
      onSurfaceVariant: Color(neutralVariantPalette.get(80)),
      outline: Color(neutralVariantPalette.get(60)),
      outlineVariant: Color(neutralVariantPalette.get(30)),
      shadow: Color(neutralPalette.get(0)),
      scrim: Color(neutralPalette.get(0)),
      inverseSurface: Color(neutralPalette.get(90)),
      onInverseSurface: Color(neutralPalette.get(20)),
      inversePrimary: Color(primaryPalette.get(40)),
      surfaceTint: Color(primaryPalette.get(80)),
    );
  }
}
