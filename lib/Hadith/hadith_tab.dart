



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Hadith/hadith_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../App_Theme/app_theme.dart';

class Hadith
{
  String title;
  String content;

  Hadith(this.title,this.content);
}

class HadithTab extends StatefulWidget {
   HadithTab({super.key});


  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadith> allHadith=[];
  Hadith h = Hadith('','');
  @override
  void initState() {
    super.initState();
    readHadithData();
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Container(

          height: 200,
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child:   const Image(image: AssetImage('assets/images/hadeth_logo.png'),),),

         Divider(color: Theme.of(context).colorScheme.secondary,height: 1,thickness: 2.5,),

         Text(AppLocalizations.of(context)!.alahadith,style: Theme.of(context).textTheme.headlineMedium,),

         Divider(color: Theme.of(context).colorScheme.secondary,height: 2,thickness: 2.5,),


        Expanded(
          child: (allHadith.isNotEmpty)?
          ListView.builder(
            itemBuilder:
                (_,index){
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context,HadithDetails.routeName,arguments: allHadith[index]);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                    child: Text(allHadith[index].title,style: Theme.of(context).textTheme.titleMedium,textAlign:TextAlign.center,))
              );},itemCount: allHadith.length,):

              Center(child: CircularProgressIndicator(),)
        )

      ],);
  }

   void readHadithData()async
   {
     String fileContent= await rootBundle.loadString('assets/ahadith/ahadith.txt');
     List<String> separatedAhadith = fileContent.trim().split('#');

     for(int i=0;i<separatedAhadith.length;i++) {
      String singleHadith = separatedAhadith[i];
      List<String> lines = singleHadith.trim().split('\n');
      String title = lines[0];
       lines.removeAt(0);
      String body =lines.join('\n');
       h = Hadith(title,body);

      allHadith.add(h);
    }
    setState(() {});

   }
}


