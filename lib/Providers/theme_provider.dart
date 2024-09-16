

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier
{

  ThemeMode currentTheme=ThemeMode.light ;
  static const String isDarkTheme='Theme';
  final SharedPreferences prefs ;

  ThemeProvider( this.prefs)
  {
    readSavedTheme();
  }

  void readSavedTheme()async
  {
    bool isDark=prefs.getBool(isDarkTheme)??false;
    currentTheme=isDark?ThemeMode.dark:ThemeMode.light;
  }

  void saveTheme()async
  {
    prefs.setBool(isDarkTheme, currentTheme==ThemeMode.dark);
  }

  void changeTheme (ThemeMode newTheme)
  {
    currentTheme=newTheme;
    notifyListeners();
    saveTheme();
  }


}