import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/App_Theme/app_theme.dart';
class BottomNavbarItem extends BottomNavigationBarItem {
  String? icImage;
  String title;
  Color bgColor;
  Icon? mainIcon;

   BottomNavbarItem(

  {required this.title,required this.bgColor,this.icImage,this.mainIcon}):
       super(

             icon: (mainIcon != null) ? mainIcon : ImageIcon(AssetImage(icImage!),size: 36,),
             label: title,
             backgroundColor: bgColor
          );
}

