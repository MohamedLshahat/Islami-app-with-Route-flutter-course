import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {

   const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {


  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
    String light = AppLocalizations.of(context)!.light;
    String dark = AppLocalizations.of(context)!.dark;

    return Container(
      padding: EdgeInsets.fromLTRB(14,24,14,0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight:Radius.circular(25)),
          border: Border(top: BorderSide(color:Theme.of(context).colorScheme.secondary,width: 2 ),
                        left: BorderSide(color:Theme.of(context).colorScheme.secondary,width: 2 ),
                        right: BorderSide(color:Theme.of(context).colorScheme.secondary,width: 2 )) ),
      child: Column(
        children: [
          InkWell(

            onTap: ()
            { setState(() { themeProvider.changeTheme(ThemeMode.light); }); },

            child: (themeProvider.currentTheme==ThemeMode.light)

                ? getSelectedTheme(light) : getUnSelectedTheme(light),

          ),

          const SizedBox(height: 24,width: double.infinity,),
          InkWell(

            onTap: (){
              setState(()
              {

               themeProvider.changeTheme(ThemeMode.dark);

              });
              },

            child: (themeProvider.currentTheme==ThemeMode.dark)

                ? getSelectedTheme(dark) : getUnSelectedTheme(dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedTheme(String themeMode)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(themeMode,style:Theme.of(context).textTheme.bodySmall?.copyWith(
            color:Theme.of(context).colorScheme.secondary),),

        Icon(Icons.check,color: Theme.of(context).colorScheme.secondary)
      ],
    );

  }

  Widget getUnSelectedTheme(String themeMode)
  {
    return Row(
      children: [
        Text(themeMode, style:Theme.of(context).textTheme.bodySmall?.copyWith(
          color:Theme.of(context).colorScheme.onSecondary,),),
      ],
    );

  }

}
