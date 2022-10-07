import 'package:chat_ui/app/resources/l10n/lang/ar.dart';
import 'package:chat_ui/app/resources/l10n/lang/en.dart';
import 'package:flutter/cupertino.dart';
import 'package:mit_x/mit_x.dart';

class LanguageManager extends Translations {
  static String lang = "en";

  @override
  Map<String, Map<String, String>> get keys => {"en": langEn, "ar": langAr};

  static void changeLanguage() {
    lang = lang == "en" ? "ar" : "en";
    MitX.changeLocale(Locale(lang));
  }
}
