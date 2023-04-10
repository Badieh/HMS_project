import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/font_manager.dart';

/// This methods is used to specify the font weight
/// the styles are ordered by font weight from w700 to w300
TextStyle _getTextStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
  );
}

// Bold style
TextStyle getBoldStyle({
  double? height,

  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
    height: height,
      fontSize: fontSize ?? FontSize.s12,
      color: color,
      fontWeight: FontWeightManager.bold);
}

// SemiBold style

TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12,
      color: color,
      fontWeight: FontWeightManager.semiBold);
}

// Medium style
TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12,
      color: color,
      fontWeight: FontWeightManager.medium);
}

// Regular style
TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12,
      color: color,
      fontWeight: FontWeightManager.regular);
}

// Light style

TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12,
      color: color,
      fontWeight: FontWeightManager.light);
}
