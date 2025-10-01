import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:material_design_system/src/responsive/breakpoint_configuration.dart';

import '../../src/responsive/responsive_value.dart';

@immutable
class SpacingTokens extends Equatable {
  final ResponsiveValue<double> _extraSmall;
  final ResponsiveValue<double> _small;
  final ResponsiveValue<double> _medium;
  final ResponsiveValue<double> _large;
  final ResponsiveValue<double> _extraLarge;
  final ResponsiveValue<double> _extraExtraLarge;
  final ResponsiveValue<double> _extraExtraExtraLarge;

  final BreakpointConfiguration breakpoints;

  const SpacingTokens({
    ResponsiveValue<double>? extraSmall,
    ResponsiveValue<double>? small,
    ResponsiveValue<double>? medium,
    ResponsiveValue<double>? large,
    ResponsiveValue<double>? extraLarge,
    ResponsiveValue<double>? extraExtraLarge,
    ResponsiveValue<double>? extraExtraExtraLarge,
    this.breakpoints = const BreakpointConfiguration(),
  }) : _extraSmall =
           extraSmall ?? const ResponsiveValue(mobile: 4.0, tablet: 5.0, desktop: 6.0),
       _small = small ?? const ResponsiveValue(mobile: 8.0, tablet: 10.0, desktop: 12.0),
       _medium =
           medium ?? const ResponsiveValue(mobile: 16.0, tablet: 20.0, desktop: 24.0),
       _large = large ?? const ResponsiveValue(mobile: 24.0, tablet: 30.0, desktop: 36.0),
       _extraLarge =
           extraLarge ?? const ResponsiveValue(mobile: 32.0, tablet: 40.0, desktop: 48.0),
       _extraExtraLarge =
           extraExtraLarge ??
           const ResponsiveValue(mobile: 48.0, tablet: 60.0, desktop: 72.0),
       _extraExtraExtraLarge =
           extraExtraExtraLarge ??
           const ResponsiveValue(mobile: 64.0, tablet: 80.0, desktop: 96.0);

  double extraSmall([BuildContext? context]) =>
      context == null ? _extraSmall.mobile : _extraSmall.resolve(context, breakpoints);
  double small([BuildContext? context]) =>
      context == null ? _small.mobile : _small.resolve(context, breakpoints);
  double medium([BuildContext? context]) =>
      context == null ? _medium.mobile : _medium.resolve(context, breakpoints);
  double large([BuildContext? context]) =>
      context == null ? _large.mobile : _large.resolve(context, breakpoints);
  double extraLarge([BuildContext? context]) =>
      context == null ? _extraLarge.mobile : _extraLarge.resolve(context, breakpoints);
  double extraExtraLarge([BuildContext? context]) => context == null
      ? _extraExtraLarge.mobile
      : _extraExtraLarge.resolve(context, breakpoints);
  double extraExtraExtraLarge([BuildContext? context]) => context == null
      ? _extraExtraExtraLarge.mobile
      : _extraExtraExtraLarge.resolve(context, breakpoints);

  EdgeInsets allExtraSmall([BuildContext? context]) =>
      EdgeInsets.all(extraSmall(context));
  EdgeInsets allSmall([BuildContext? context]) => EdgeInsets.all(small(context));
  EdgeInsets allMedium([BuildContext? context]) => EdgeInsets.all(medium(context));
  EdgeInsets allLarge([BuildContext? context]) => EdgeInsets.all(large(context));
  EdgeInsets allExtraLarge([BuildContext? context]) =>
      EdgeInsets.all(extraLarge(context));

  EdgeInsets hExtraSmall([BuildContext? context]) =>
      EdgeInsets.symmetric(horizontal: extraSmall(context));
  EdgeInsets hSmall([BuildContext? context]) =>
      EdgeInsets.symmetric(horizontal: small(context));
  EdgeInsets hMedium([BuildContext? context]) =>
      EdgeInsets.symmetric(horizontal: medium(context));
  EdgeInsets hLarge([BuildContext? context]) =>
      EdgeInsets.symmetric(horizontal: large(context));
  EdgeInsets hExtraLarge([BuildContext? context]) =>
      EdgeInsets.symmetric(horizontal: extraLarge(context));

  EdgeInsets vExtraSmall([BuildContext? context]) =>
      EdgeInsets.symmetric(vertical: extraSmall(context));
  EdgeInsets vSmall([BuildContext? context]) =>
      EdgeInsets.symmetric(vertical: small(context));
  EdgeInsets vMedium([BuildContext? context]) =>
      EdgeInsets.symmetric(vertical: medium(context));
  EdgeInsets vLarge([BuildContext? context]) =>
      EdgeInsets.symmetric(vertical: large(context));
  EdgeInsets vExtraLarge([BuildContext? context]) =>
      EdgeInsets.symmetric(vertical: extraLarge(context));

  SpacingTokens copyWith({
    ResponsiveValue<double>? extraSmall,
    ResponsiveValue<double>? small,
    ResponsiveValue<double>? medium,
    ResponsiveValue<double>? large,
    ResponsiveValue<double>? extraLarge,
    ResponsiveValue<double>? extraExtraLarge,
    ResponsiveValue<double>? extraExtraExtraLarge,
    BreakpointConfiguration? breakpoints,
  }) {
    return SpacingTokens(
      extraSmall: extraSmall ?? _extraSmall,
      small: small ?? _small,
      medium: medium ?? _medium,
      large: large ?? _large,
      extraLarge: extraLarge ?? _extraLarge,
      extraExtraLarge: extraExtraLarge ?? _extraExtraLarge,
      extraExtraExtraLarge: extraExtraExtraLarge ?? _extraExtraExtraLarge,
      breakpoints: breakpoints ?? this.breakpoints,
    );
  }

  @override
  List<Object?> get props => [
    _extraSmall,
    _small,
    _medium,
    _large,
    _extraLarge,
    _extraExtraLarge,
    _extraExtraExtraLarge,
    breakpoints,
  ];

  @override
  String toString() {
    return 'SpacingTokens(extraSmall: $_extraSmall, small: $_small, medium: $_medium, large: $_large, extraLarge: $_extraLarge, extraExtraLarge: $_extraExtraLarge, extraExtraExtraLarge: $_extraExtraExtraLarge, breakpoints: $breakpoints)';
  }
}
