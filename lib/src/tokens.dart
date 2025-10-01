import 'package:flutter/material.dart';

/// The six seed colors that define the brand identity.
/// These are the immutable "single source of truth" for generating a theme.
@immutable
class SeedColors {
  const SeedColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
    required this.error,
  });

  // TODO: Source of input list not provided. Should I mock or will you supply it?
  // Using placeholders for now.
  factory SeedColors.fallback() => const SeedColors(
    primary: Color(0xFF6750A4),
    secondary: Color(0xFF625B71),
    tertiary: Color(0xFF7D5260),
    neutral: Color(0xFF939094),
    neutralVariant: Color(0xFF79747E),
    error: Color(0xFFB3261E),
  );

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color neutral;
  final Color neutralVariant;
  final Color error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeedColors &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          secondary == other.secondary &&
          tertiary == other.tertiary &&
          neutral == other.neutral &&
          neutralVariant == other.neutralVariant &&
          error == other.error;

  @override
  int get hashCode =>
      primary.hashCode ^
      secondary.hashCode ^
      tertiary.hashCode ^
      neutral.hashCode ^
      neutralVariant.hashCode ^
      error.hashCode;
}

/// A set of semantic color roles that are generated from the [SeedColors].
/// This represents the "System Tokens" layer.
@immutable
class SystemTokens {
  const SystemTokens({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.surfaceTint,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  final Color surfaceTint;
}
