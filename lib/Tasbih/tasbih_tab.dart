


import 'package:flutter/material.dart';
import 'package:islami/App_Theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_provider.dart';




class TasbihTab extends StatefulWidget {
   TasbihTab({super.key});

  @override
  State<TasbihTab> createState() => _TasbihTabState();
}

class _TasbihTabState extends State<TasbihTab> {

  List<String> tasbih=['سبحان الله','الحمد لله','الله أكبر'];

  int index=0;
  double rotAngle=5;

  int noTasbih=0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [Container(
              width: double.infinity,
              height: 150,
              alignment: const Alignment(0.15,-0.8),
              child: Image.asset((themeProvider.currentTheme==ThemeMode.dark)
                  ?'assets/images/head_sebha_dark.png'
                  :'assets/images/head_sebha_light.png',)),
            Container(
              margin: const EdgeInsets.all(55),
                width: double.infinity,
                height: 260,
                alignment: Alignment.bottomCenter,
                child: InkWell(
                    onTap:(){setState(() {

                      playTasbih();
                      rotAngle+=5;


                    });},
                    child: Transform.rotate(angle:rotAngle,
                        child: Image.asset((themeProvider.currentTheme==ThemeMode.dark)
                                  ?'assets/images/body_sebha_dark.png'
                                  :'assets/images/body_sebha_light.png',)))),
          ],),

           Text(AppLocalizations.of(context)!.praisesNumber,
            style: Theme.of(context).textTheme.titleMedium,),

          Container(
            height: 100,
            width: 90,
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(30)),
            child: Text('$noTasbih',style: Theme.of(context).textTheme.headlineMedium),
          ),

          Container(
            height: 75,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50)),
            child: Text(tasbih[index],style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          )

        ],
      ),
    );


  }

   void playTasbih()
   {

      if (noTasbih == 33)
      {
        noTasbih=0;
        index++;
        if(index<tasbih.length)
          {
            return;
          }
        else
          {
            index=0;
          }
      }
      else
      {
        noTasbih++;
      }

  }
}