


import 'package:flutter/material.dart';
import 'package:islami/App_Theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';






class RadioTab extends StatelessWidget
{

  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
        
            padding: EdgeInsets.symmetric(vertical: 50),

              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/radio_image.png' ,height: 200,width: 400,)),

           Container(
             padding: EdgeInsets.symmetric(vertical: 50),
             child: Text(AppLocalizations.of(context)!.radio,
              style: Theme.of(context).textTheme.headlineMedium,),
           ),

           Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
            Icon(Icons.skip_previous,
              color:Theme.of(context).colorScheme.secondary,size: 40,textDirection: TextDirection.ltr,),

            Icon(Icons.play_arrow_rounded,
                color:Theme.of(context).colorScheme.secondary,size: 60),

            Icon(Icons.skip_next,
                color:Theme.of(context).colorScheme.secondary,size: 40,textDirection: TextDirection.ltr),
          ],),



        ],
      ),
    );


  }


}