

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Settings/lang_bottom_sheet.dart';
import 'package:islami/Settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../Providers/local_provider.dart';
import '../Providers/theme_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  String getSelectedTheme(context)
  {
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);

    if(themeProvider.currentTheme==ThemeMode.light)
    { return AppLocalizations.of(context)!.light; }
    else
    { return AppLocalizations.of(context)!.dark; }

  }

  String getSelectedLocale(context)
  {
    LocalProvider localProvider =Provider.of<LocalProvider>(context);

    if(localProvider.currentLocal=='en')
    { return AppLocalizations.of(context)!.english; }
    else
    { return AppLocalizations.of(context)!.arabic; }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,70,10,0),
        child: Column(


          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(AppLocalizations.of(context)!.theme,
                  style:TextStyle(color:Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20 ) ,)),

            Container(
              height:50 ,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).colorScheme.secondary,width: 2.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(

                onTap: (){showBottomSheet(context,'theme');},

                child: Text(getSelectedTheme(context),style:Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary),),
              ),
            ),

            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(AppLocalizations.of(context)!.lang,
                  style:TextStyle(color:Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20 ) ,)),

            Container(
              height:50 ,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).colorScheme.secondary,width: 2.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(

                onTap: (){showBottomSheet(context,'language');},

                child: Text(getSelectedLocale(context),style:Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary),),
              ),)]

      ),
    );

  }

  void showBottomSheet(BuildContext context,String type)
  {

    showModalBottomSheet(context: context,
        builder:( context) {
          if (type == 'theme') {
            return const ThemeBottomSheet();
          }
          else {
            return const LangBottomSheet();
          }
        });

  }
}
