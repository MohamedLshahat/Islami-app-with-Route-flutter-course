import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami/Hadith/hadith_details.dart';
import 'package:islami/Providers/theme_provider.dart';
import 'package:islami/Qur2an/chapter_details/chapter_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'App_Theme/app_theme.dart';
import 'Home/home_screen.dart';
import 'Providers/local_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds:2));

  FlutterNativeSplash.remove();


   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(
      MultiProvider(
          providers:[
            ChangeNotifierProvider(create:(_)=>ThemeProvider(sharedPreferences)),
            ChangeNotifierProvider(create:(_)=>LocalProvider(sharedPreferences)),
          ],


          child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LocalProvider localProvider = Provider.of<LocalProvider>(context);

    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ChapterDetails.routeName: (_) =>  const ChapterDetails(),
        HadithDetails.routeName: (_) => const HadithDetails(),
      },


      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,


      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localProvider.currentLocal),


    );
  }
}




