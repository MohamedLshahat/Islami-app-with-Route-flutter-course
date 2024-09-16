
import 'package:flutter/material.dart';
import 'package:islami/App_Theme/app_theme.dart';
import 'package:islami/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DefaultScreen extends StatelessWidget {

  final Widget body;

   const DefaultScreen({required this.body,super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);

    return Stack(

      children: [

          Image(image:AssetImage(
              (themeProvider.currentTheme==ThemeMode.light)?
              'assets/images/light_background.png' : 'assets/images/dark_background.png'))  ,


          body

      ],);
  }
}
