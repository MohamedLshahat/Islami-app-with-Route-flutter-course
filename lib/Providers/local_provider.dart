


import 'package:flutter/material.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

class LocalProvider extends ChangeNotifier
{

  String currentLocal='en' ;
  static const String localeKey ='lang';
  final SharedPreferences prefs;


  LocalProvider(this.prefs)
  {
    readSavedLocale();
  }

  void readSavedLocale()async
  {
    currentLocal =prefs.getString(localeKey) ?? 'en';
  }

  void saveLocale()async
  {
    prefs.setString(localeKey, currentLocal);
  }

  void changeLocal (String newLocal)
  {
  currentLocal=newLocal;
  notifyListeners();
  saveLocale();
  }


}