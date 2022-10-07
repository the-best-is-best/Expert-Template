import 'package:chat_ui/app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../resources/font_manger.dart';

ThemeData get themeDataLight {
  return ThemeData(
    fontFamily: FontConstants.mainFontFamily,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: ColorManager.mainColor,
        ),
  );
}
