import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Providers/local_provider.dart';

class LangBottomSheet extends StatefulWidget {
  const LangBottomSheet({super.key});

  @override
  State<LangBottomSheet> createState() => _LangBottomSheetState();
}

class _LangBottomSheetState extends State<LangBottomSheet> {
  @override
  Widget build(BuildContext context) {

    LocalProvider localProvider = Provider.of<LocalProvider>(context);
    String english = AppLocalizations.of(context)!.english;
    String arabic = AppLocalizations.of(context)!.arabic;

    return Container(
      padding: EdgeInsets.fromLTRB(14, 24, 14, 0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
              left: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
              right: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2))),

      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() { localProvider.changeLocal('en'); });
              },

              child: (localProvider.currentLocal == 'en')
                  ? getSelectedTheme(english)
                  : getUnSelectedTheme(english),
        ),

          const SizedBox(
            height: 24,
            width: double.infinity,
          ),
          InkWell(
            onTap: () {
              setState(() {
                localProvider.changeLocal('ar');
              });
            },
            child: (localProvider.currentLocal == 'ar')
                ? getSelectedTheme(arabic)
                : getUnSelectedTheme(arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedTheme(String locale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          locale,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary),
        ),
        Icon(Icons.check, color: Theme.of(context).colorScheme.secondary)
      ],
    );
  }

  Widget getUnSelectedTheme(String locale) {
    return Row(
      children: [
        Text(
          locale,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ],
    );
  }
}
