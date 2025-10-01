import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Shape tokens for border radii, corner curves, and other geometric properties.
@immutable
class ShapeTokens extends Equatable {
  // Raw corner radius values
  final double cornerExtraSmall;
  final double cornerSmall;
  final double cornerMedium;
  final double cornerLarge;
  final double cornerExtraLarge;
  final double cornerFull;

  // Getters for derived BorderRadius values
  BorderRadius get borderRadiusExtraSmall => BorderRadius.circular(cornerExtraSmall);
  BorderRadius get borderRadiusSmall => BorderRadius.circular(cornerSmall);
  BorderRadius get borderRadiusMedium => BorderRadius.circular(cornerMedium);
  BorderRadius get borderRadiusLarge => BorderRadius.circular(cornerLarge);
  BorderRadius get borderRadiusExtraLarge => BorderRadius.circular(cornerExtraLarge);
  BorderRadius get borderRadiusFull => BorderRadius.circular(cornerFull);

  // Getters for derived ShapeBorder values
  ShapeBorder get shapeExtraSmall => RoundedRectangleBorder(borderRadius: borderRadiusExtraSmall);
  ShapeBorder get shapeSmall => RoundedRectangleBorder(borderRadius: borderRadiusSmall);
  ShapeBorder get shapeMedium => RoundedRectangleBorder(borderRadius: borderRadiusMedium);
  ShapeBorder get shapeLarge => RoundedRectangleBorder(borderRadius: borderRadiusLarge);
  ShapeBorder get shapeExtraLarge => RoundedRectangleBorder(borderRadius: borderRadiusExtraLarge);
  ShapeBorder get shapeFull => RoundedRectangleBorder(borderRadius: borderRadiusFull);

  // Getters for top-rounded border radius
  BorderRadius get borderRadiusTopExtraSmall => BorderRadius.vertical(top: Radius.circular(cornerExtraSmall));
  BorderRadius get borderRadiusTopSmall => BorderRadius.vertical(top: Radius.circular(cornerSmall));
  BorderRadius get borderRadiusTopMedium => BorderRadius.vertical(top: Radius.circular(cornerMedium));
  BorderRadius get borderRadiusTopLarge => BorderRadius.vertical(top: Radius.circular(cornerLarge));
  BorderRadius get borderRadiusTopExtraLarge => BorderRadius.vertical(top: Radius.circular(cornerExtraLarge));

  // Getters for top-rounded shapes
  ShapeBorder get shapeTopExtraSmall => RoundedRectangleBorder(borderRadius: borderRadiusTopExtraSmall);
  ShapeBorder get shapeTopSmall => RoundedRectangleBorder(borderRadius: borderRadiusTopSmall);
  ShapeBorder get shapeTopMedium => RoundedRectangleBorder(borderRadius: borderRadiusTopMedium);
  ShapeBorder get shapeTopLarge => RoundedRectangleBorder(borderRadius: borderRadiusTopLarge);
  ShapeBorder get shapeTopExtraLarge => RoundedRectangleBorder(borderRadius: borderRadiusTopExtraLarge);

  // Getters for bottom-rounded border radius
  BorderRadius get borderRadiusBottomExtraSmall => BorderRadius.vertical(bottom: Radius.circular(cornerExtraSmall));
  BorderRadius get borderRadiusBottomSmall => BorderRadius.vertical(bottom: Radius.circular(cornerSmall));
  BorderRadius get borderRadiusBottomMedium => BorderRadius.vertical(bottom: Radius.circular(cornerMedium));
  BorderRadius get borderRadiusBottomLarge => BorderRadius.vertical(bottom: Radius.circular(cornerLarge));
  BorderRadius get borderRadiusBottomExtraLarge => BorderRadius.vertical(bottom: Radius.circular(cornerExtraLarge));

  // Getters for bottom-rounded shapes
  ShapeBorder get shapeBottomExtraSmall => RoundedRectangleBorder(borderRadius: borderRadiusBottomExtraSmall);
  ShapeBorder get shapeBottomSmall => RoundedRectangleBorder(borderRadius: borderRadiusBottomSmall);
  ShapeBorder get shapeBottomMedium => RoundedRectangleBorder(borderRadius: borderRadiusBottomMedium);
  ShapeBorder get shapeBottomLarge => RoundedRectangleBorder(borderRadius: borderRadiusBottomLarge);
  ShapeBorder get shapeBottomExtraLarge => RoundedRectangleBorder(borderRadius: borderRadiusBottomExtraLarge);

  // Getters for left-rounded border radius
  BorderRadius get borderRadiusLeftExtraSmall => BorderRadius.horizontal(left: Radius.circular(cornerExtraSmall));
  BorderRadius get borderRadiusLeftSmall => BorderRadius.horizontal(left: Radius.circular(cornerSmall));
  BorderRadius get borderRadiusLeftMedium => BorderRadius.horizontal(left: Radius.circular(cornerMedium));
  BorderRadius get borderRadiusLeftLarge => BorderRadius.horizontal(left: Radius.circular(cornerLarge));
  BorderRadius get borderRadiusLeftExtraLarge => BorderRadius.horizontal(left: Radius.circular(cornerExtraLarge));

  // Getters for left-rounded shapes
  ShapeBorder get shapeLeftExtraSmall => RoundedRectangleBorder(borderRadius: borderRadiusLeftExtraSmall);
  ShapeBorder get shapeLeftSmall => RoundedRectangleBorder(borderRadius: borderRadiusLeftSmall);
  ShapeBorder get shapeLeftMedium => RoundedRectangleBorder(borderRadius: borderRadiusLeftMedium);
  ShapeBorder get shapeLeftLarge => RoundedRectangleBorder(borderRadius: borderRadiusLeftLarge);
  ShapeBorder get shapeLeftExtraLarge => RoundedRectangleBorder(borderRadius: borderRadiusLeftExtraLarge);

  // Getters for right-rounded border radius
  BorderRadius get borderRadiusRightExtraSmall => BorderRadius.horizontal(right: Radius.circular(cornerExtraSmall));
  BorderRadius get borderRadiusRightSmall => BorderRadius.horizontal(right: Radius.circular(cornerSmall));
  BorderRadius get borderRadiusRightMedium => BorderRadius.horizontal(right: Radius.circular(cornerMedium));
  BorderRadius get borderRadiusRightLarge => BorderRadius.horizontal(right: Radius.circular(cornerLarge));
  BorderRadius get borderRadiusRightExtraLarge => BorderRadius.horizontal(right: Radius.circular(cornerExtraLarge));

  // Getters for right-rounded shapes
  ShapeBorder get shapeRightExtraSmall => RoundedRectangleBorder(borderRadius: borderRadiusRightExtraSmall);
  ShapeBorder get shapeRightSmall => RoundedRectangleBorder(borderRadius: borderRadiusRightSmall);
  ShapeBorder get shapeRightMedium => RoundedRectangleBorder(borderRadius: borderRadiusRightMedium);
  ShapeBorder get shapeRightLarge => RoundedRectangleBorder(borderRadius: borderRadiusRightLarge);
  ShapeBorder get shapeRightExtraLarge => RoundedRectangleBorder(borderRadius: borderRadiusRightExtraLarge);

  /// Creates a new [ShapeTokens] instance.
  const ShapeTokens({
    this.cornerExtraSmall = 4.0,
    this.cornerSmall = 8.0,
    this.cornerMedium = 12.0,
    this.cornerLarge = 16.0,
    this.cornerExtraLarge = 28.0,
    this.cornerFull = 999.0, // A large value to simulate a circle
  });

  /// Creates a copy of this [ShapeTokens] but with the given fields replaced.
  ShapeTokens copyWith({
    double? cornerExtraSmall,
    double? cornerSmall,
    double? cornerMedium,
    double? cornerLarge,
    double? cornerExtraLarge,
    double? cornerFull,
  }) {
    return ShapeTokens(
      cornerExtraSmall: cornerExtraSmall ?? this.cornerExtraSmall,
      cornerSmall: cornerSmall ?? this.cornerSmall,
      cornerMedium: cornerMedium ?? this.cornerMedium,
      cornerLarge: cornerLarge ?? this.cornerLarge,
      cornerExtraLarge: cornerExtraLarge ?? this.cornerExtraLarge,
      cornerFull: cornerFull ?? this.cornerFull,
    );
  }

  @override
  List<Object?> get props => [
        cornerExtraSmall,
        cornerSmall,
        cornerMedium,
        cornerLarge,
        cornerExtraLarge,
        cornerFull,
      ];
}
