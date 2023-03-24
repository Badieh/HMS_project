import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required Color color,
    required FontWeight fontWeight}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: FontConstants.fontFamily,
  );
}

// Regular style

TextStyle getRegularStyle({
  double? fontSize ,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12, color: color, fontWeight: FontWeightManager.regular);
}

// Bold style

TextStyle getBoldStyle({
  double ?fontSize ,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12, color: color, fontWeight: FontWeightManager.bold);
}

// Medium style

TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12, color: color, fontWeight: FontWeightManager.medium);
}

// SemiBold style

TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12, color: color, fontWeight: FontWeightManager.semiBold);
}

// Light style

TextStyle getLightStyle({
  double? fontSize,
  required Color color,
}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12, color: color, fontWeight: FontWeightManager.light);
}
