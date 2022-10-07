import 'package:chat_ui/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontConstants {
  static const String mainFontFamily = FontFamily.poppins;
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static double get s9 => 9.sp;
  static double get s12 => 12.sp;
  static double get s14 => 14.sp;
  static double get s15 => 15.sp;
  static double get s16 => 16.sp;
  static double get s18 => 18.sp;
  static double get s19 => 19.sp;
  static double get s40 => 40.sp;
}
