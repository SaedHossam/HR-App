import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context,String key){
  return DemoLocalizations.of(context).getTranslatedValue(key);
}
// language Codes
const String ARABIC = 'ar';
const String ENGLISH = 'en';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _local(languageCode);
}

Locale _local(String languageCode){
  Locale _temp;
  switch(languageCode){
    case ENGLISH :
      _temp = Locale(languageCode,'US');break;
    case ARABIC :
      _temp = Locale(languageCode,'EG');break;
    default :
      _temp = Locale(ENGLISH,'US');break;
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _local(languageCode);
}