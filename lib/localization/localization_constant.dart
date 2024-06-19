import 'package:eventright_pro_user/constant/lang_pref.dart';
import 'package:eventright_pro_user/constant/pref_constants.dart';
import 'package:eventright_pro_user/localization/language_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String? getTranslated(BuildContext context, String key) {
  return LanguageLocalization.of(context)!.getTranslateValue(key);
}

const String english = "en";
const String spanish = "es";
const String arabic = "ar";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferenceHelperUtils.setString(Preferences.currentLanguageCode, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case english:
      _temp = Locale(languageCode, 'US');
      break;
    case spanish:
      _temp = Locale(languageCode, 'ES');
      break;
    case arabic:
      _temp = Locale(languageCode, 'AE');
      break;
    default:
      _temp = const Locale(english, 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  String languageCode = SharedPreferenceHelperUtils.getString(Preferences.currentLanguageCode)!;
  return _locale(languageCode);
}
