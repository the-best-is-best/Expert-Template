import 'package:flutter/material.dart';
import '../resources/font_manger.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

// light

TextStyle getLightStyle({
  //double fontSize = FontSize.s12,
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: color ?? Colors.black);
}

// regular

TextStyle getRegularStyle({
  //double fontSize = FontSize.s14,
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color ?? Colors.black);
}

// medium

TextStyle getMediumStyle({
  //double fontSize = FontSize.s16,
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      color: color ?? Colors.black);
}

// semi bold

TextStyle getSemiBoldStyle({
  // double fontSize = FontSize.s18,
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      color: color ?? Colors.black);
}

// bold

TextStyle getBoldStyle({
  // double fontSize = FontSize.s20,
  required double fontSize,
  Color? color,
}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color ?? Colors.black);
}