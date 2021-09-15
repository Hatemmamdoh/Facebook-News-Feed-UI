import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsfeed/screens/home.dart';
import 'package:flutter_newsfeed/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/foundation.dart';

import 'app_bar.dart';


class NavScreen extends StatefulWidget {

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>
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
    SizeConfig().init(context);

    return DefaultTabController(length: 6,
        child: Scaffold(
          appBar:!kIsWeb ? null :
          PreferredSize(
            child: Container(
              // height:SizeConfig.safeBlockVerticalWithAppBar*20,
              padding: EdgeInsets.symmetric(horizontal: 2*SizeConfig.safeBlockHorizontal,
                  vertical: SizeConfig.safeBlockVerticalWithAppBar*0.5),
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("facebook" , style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  ),),
                  Container(
                    width: 50*SizeConfig.safeBlockHorizontal,
                    child: TabBar(
                    onTap: (index) => setState(() {
                      selected = index;
                    }),
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.blue,
                              width: SizeConfig.safeBlockHorizontal*0.2
                          ),
                        ),
                      ),
                    tabs: [
                      Tab(icon: Icon(Icons.home,color: selected == 0 ? Colors.blueAccent : Colors.black45,size: SizeConfig.safeBlockVerticalWithAppBar*4,)),
                      Tab(icon: Icon(Icons.ondemand_video, color: selected == 1 ? Colors.blueAccent : Colors.black45,size:SizeConfig.safeBlockVerticalWithAppBar*4)),
                      Tab(icon: Icon(MdiIcons.accountCircleOutline , color: selected == 2 ? Colors.blueAccent : Colors.black45,size:SizeConfig.safeBlockVerticalWithAppBar*4)),
                      Tab(icon: Icon(MdiIcons.accountGroupOutline, color: selected == 3 ? Colors.blueAccent : Colors.black45,size: SizeConfig.safeBlockVerticalWithAppBar*4)),
                      Tab(icon: Icon(MdiIcons.bellOutline,color: selected == 4 ? Colors.blueAccent : Colors.black45, size:SizeConfig.safeBlockVerticalWithAppBar*4),),
                      Tab(icon: Icon(Icons.menu, color: selected == 5 ? Colors.blueAccent : Colors.black45,size: SizeConfig.safeBlockVerticalWithAppBar*4)),
                    ],
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,

                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.search)
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(MdiIcons.facebookMessenger)
                      ),
                    ],
                  )

                ],
              ),
            )

            ,preferredSize: Size(SizeConfig.safeBlockHorizontal*100,
              SizeConfig.safeBlockVerticalWithAppBar*8),
          ),
          body: screens[selected],
          bottomNavigationBar: !kIsWeb ?TabBar(
            indicator: BoxDecoration(
              border: Border(top: BorderSide(
               color: Colors.blueAccent,
               width: SizeConfig.safeBlockHorizontal*0.5
              ))
            ),
            indicatorPadding: EdgeInsets.zero,
            onTap: (index) => setState(() {
              selected = index;
            }),
            tabs: [
              Tab(icon: Icon(Icons.home,color: selected == 0 ? Colors.blueAccent : Colors.black45,)),
              Tab(icon: Icon(Icons.ondemand_video, color: selected == 1 ? Colors.blueAccent : Colors.black45)),
              Tab(icon: Icon(MdiIcons.accountCircleOutline , color: selected == 2 ? Colors.blueAccent : Colors.black45)),
              Tab(icon: Icon(MdiIcons.accountGroupOutline, color: selected == 3 ? Colors.blueAccent : Colors.black45)),
              Tab(icon: Icon(MdiIcons.bellOutline,color: selected == 4 ? Colors.blueAccent : Colors.black45)),
              Tab(icon: Icon(Icons.menu, color: selected == 5 ? Colors.blueAccent : Colors.black45)),
            ],
            
          ): SizedBox.shrink()
        )
    );

  }

}