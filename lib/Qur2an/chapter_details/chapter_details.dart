


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Qur2an/quraan_tab.dart';
import 'package:islami/App_Theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Home/default_screen.dart';

class ChapterDetails extends StatefulWidget {

  static const String routeName ='Chapter_Details';




    const ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
   List<String> verses =[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)
        ?.settings.arguments as ChapterDetailsArgs;
    if(verses.isEmpty) {
      readChapterData(args.chapterIndex);

    }

    return DefaultScreen(

      body: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title:  Text(AppLocalizations.of(context)!.appTitle,),),
            body: Card(


              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,40,20,20),
                child: Column(

                  children: [
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        const SizedBox(width: 30,),
                        Text('سورة ${args.chapterName}'
                          ,style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,),


                         Icon(Icons.play_circle,color:Theme.of(context).colorScheme.onPrimary,size: 35,)],),

                    Container(height: 2,width: double.infinity,color: Theme.of(context).colorScheme.secondary,margin: const EdgeInsets.fromLTRB(0,10,0,20 ),),

                    Expanded(
                        child:(verses.isEmpty)?

                        const Center(child: CircularProgressIndicator()) :

                        ListView.builder(itemBuilder:
                              (_,index)
                                {
                                  return Text(
                                    verses[index],
                                    style: Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.right,);

                                },itemCount:verses.length,)
                    )
                  ],
                ),
              ),),
          )

      );
  }

  void readChapterData(int index) async
  {
    String sura = await rootBundle.loadString('assets/suars/${index+1}.txt');
    List<String> lines = sura.trim().split('\n');

    setState(() {
      verses = lines;
    });

  }
}

class ChapterDetailsArgs
{
  String chapterName;
  int chapterIndex;

  ChapterDetailsArgs(this.chapterName,this.chapterIndex);
}