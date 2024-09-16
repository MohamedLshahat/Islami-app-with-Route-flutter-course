
import 'package:flutter/material.dart';
import 'package:islami/Hadith/hadith_tab.dart';
import 'package:islami/Home/default_screen.dart';
import 'package:islami/Qur2an/quraan_tab.dart';
import 'package:islami/Home/bottom_navbar_item.dart';
import 'package:islami/Settings/settings_tab.dart';

import '../Radio/radio_tab.dart';
import '../Tasbih/tasbih_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ='Home';

   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex =0;

  List<Widget> tabs=[QuraanTab(), HadithTab(), TasbihTab(), RadioTab(),SettingsTab() ];


  @override
  Widget build(BuildContext context) {
    return DefaultScreen(

        body:Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(title:  Text(AppLocalizations.of(context)!.appTitle,),),

          body:tabs[tabIndex],


          bottomNavigationBar: BottomNavigationBar(

            onTap: (index){
              setState(() {
                tabIndex= index;
              });
            },

            currentIndex: tabIndex,
            items:   [

              BottomNavbarItem(icImage: 'assets/images/3.0x/icon_quran@3x.png',
                  title:AppLocalizations.of(context)!.quranTab,
                  bgColor:Theme.of(context).colorScheme.primary),
              BottomNavbarItem(icImage:'assets/images/2.0x/icon_hadeth@2x.png',
                  title:AppLocalizations.of(context)!.hadithTab,
                  bgColor:Theme.of(context).colorScheme.primary),
              BottomNavbarItem(icImage:'assets/images/3.0x/icon_sebha@3x.png',
                  title:AppLocalizations.of(context)!.tasbihTab,
                  bgColor:Theme.of(context).colorScheme.primary),
              BottomNavbarItem(icImage:'assets/images/3.0x/icon_radio@3x.png',
                  title:AppLocalizations.of(context)!.radioTab,
                  bgColor:Theme.of(context).colorScheme.primary),
              BottomNavbarItem(mainIcon:const Icon(Icons.settings,size: 36,),
                  title:AppLocalizations.of(context)!.settings,
                  bgColor:Theme.of(context).colorScheme.primary),

          ],


          ),
        ));


  }
}
