import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsfeed/screens/desktop.dart';
import 'package:flutter_newsfeed/screens/mobile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/foundation.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context) {
    if(!kIsWeb) {
      return MobileScreen() ;
    }
    else{
      return WebScreen() ;
    }
  }

}