import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:islami/Hadith/hadith_tab.dart';
import '../App_Theme/app_theme.dart';
import '../Home/default_screen.dart';

class HadithDetails extends StatefulWidget {

  static const String routeName ='hadith_details';
    const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {


  @override
  Widget build(BuildContext context) {


    Hadith hadith = ModalRoute.of(context)?.settings.arguments as Hadith;

    return DefaultScreen(

        body: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title:  Text(AppLocalizations.of(context)!.appTitle,),),
            body: Card(

              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,40,20,20),
                child: Column(
                  children: [

                    Text(hadith.title,style: Theme.of(context).textTheme.titleLarge,),

                  Container(height: 2,width: double.infinity,color: Theme.of(context).colorScheme.onPrimary,margin: const EdgeInsets.fromLTRB(0,10,0,20 ),),

                    Expanded(child:  Text(hadith.content,style: Theme.of(context).textTheme.bodySmall)
                          )

                       ] ,)
                    )
           ,
                ),
              ),);





  }


}

