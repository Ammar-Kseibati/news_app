import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_constance/font_constance.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

TextStyle getSmallStyle(
    {double fontSize = FontSize.s11,
    fontFamily = FontFamily.merriweatherFamily,
    FontWeight fontWeight = FontWeightManager.semiBold,
    color}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s15,
    fontFamily = FontFamily.arapeyFamily,
    FontWeight fontWeight = FontWeightManager.semiBold,
    color}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color);
}

TextStyle getMediumLargStyle(
    {double fontSize = FontSize.s18,
    fontFamily = FontFamily.arapeyFamily,
    FontWeight fontWeight = FontWeightManager.semiBold,
    color}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color);
}

TextStyle getTitleStyle(
    {double fontSize = FontSize.s19,
    fontFamily = FontFamily.arapeyFamily,
    FontWeight fontWeight = FontWeightManager.bold,
    color}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color);
}

TextStyle getLargStyle(
    {double fontSize = FontSize.s30,
    fontFamily = FontFamily.arapeyFamily,
    FontWeight fontWeight = FontWeightManager.semiBold,
    color = Colors.white}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color);
}

TextStyle getButtonStyle(
    {double fontSize = FontSize.s25,
    fontFamily = FontFamily.arapeyFamily,
    FontWeight fontWeight = FontWeightManager.bold,
    color = Colors.black}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color);
}
