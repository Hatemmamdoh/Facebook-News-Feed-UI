import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsfeed/screens/desktop.dart';
import 'package:flutter_newsfeed/screens/mobile.dart';
import 'package:flutter_newsfeed/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/foundation.dart';

import 'home.dart';


class AppBarScreen extends StatefulWidget {

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen>
{
  List <Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ] ;
  int selected = 0 ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );

  }


}