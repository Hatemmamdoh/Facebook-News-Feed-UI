import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsfeed/providers/post_provider.dart';
import 'package:flutter_newsfeed/providers/post_states.dart';
import 'package:flutter_newsfeed/screens/navegation.dart';
import 'package:flutter_newsfeed/screens/splash_screen.dart';
import 'package:flutter_newsfeed/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'test.dart' as Example;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebScreen extends StatelessWidget {

  bool allLoaded = false ;


  Widget appbar (context){
    return Row (
      children: [
        Flexible(
          child: Container(
            width: SizeConfig.safeBlockHorizontal*25,
            child: Column(
              children: [
                Text("Contacts", style: TextStyle(color: Colors.grey),),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context,int index){
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal*2
                          ,vertical: SizeConfig.safeBlockVerticalWithAppBar*2),
                          child: Row(
                            children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black45,
                                  ),
                                  SizedBox(width: SizeConfig.safeBlockHorizontal*2,),
                                  Expanded(child: Text("Hatem Mamdoh"))
                            ],
                          ),
                        ) ;
                      }
                  ),
                ),
              ],

            ),
          ),
        ),
        Container(
          color: Colors.white,
          width: SizeConfig.safeBlockHorizontal*50,
          child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    height: 18*SizeConfig.safeBlockVerticalWithAppBar,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Divider(
                          height: SizeConfig.safeBlockVerticalWithAppBar*3,
                          thickness: 0.6,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVerticalWithAppBar*1
                              ,horizontal: SizeConfig.safeBlockHorizontal*1),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(PostBloc.get(context).users[0].imageUrl),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal*2,
                            ),
                            Flexible(
                              child: Container(
                                width: 40*SizeConfig.blockSizeHorizontal,
                                child: TextField(
                                  decoration: new InputDecoration.collapsed(
                                    hintText: "What's in your mind?",
                                    // hintStyle: TextStyle(color : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 0.6,
                          height: 10,
                        ),
                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: FlatButton.icon(onPressed: (){},
                                  icon: Icon(Icons.videocam,
                                    color: Colors.pink,
                                  ),
                                  label: Text("Live"),

                                ),
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                width: 5,
                              ),
                              Flexible(
                                child:FlatButton.icon(onPressed: (){},
                                  icon: Icon(Icons.photo_library,
                                    color: Colors.greenAccent,
                                  ),
                                  label: Text("Photo")
                              ),
                              ),

                              VerticalDivider(
                                width: 5,
                              ),
                              Flexible(
                                child: FlatButton.icon(onPressed: (){},
                                  icon: Icon(Icons.video_call,
                                    color: Colors.purple,
                                  ),
                                  label: Text("Room"),
                                ),
                              )

                            ],
                          ),
                      ],
                    ),

                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 1*SizeConfig.safeBlockVerticalWithAppBar,
                    color: Colors.grey[300],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    height: 30*SizeConfig.safeBlockVerticalWithAppBar,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              height: 29*SizeConfig.safeBlockVerticalWithAppBar,
                              width: 30*SizeConfig.blockSizeHorizontal,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  'https://placeimg.com/640/480/any',
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                margin: EdgeInsets.all(5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2.0
                                  ,top: SizeConfig.safeBlockVerticalWithAppBar*2.0),
                              child: CircleAvatar(
                                backgroundImage:NetworkImage(
                                  'https://placeimg.com/640/480/any',
                                ) ,
                                backgroundColor: Colors.black,
                              ) ,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 1*SizeConfig.safeBlockVerticalWithAppBar,
                    color: Colors.grey[300],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2.0
                                ,top: SizeConfig.safeBlockVerticalWithAppBar*2.0,) ,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:AssetImage(
                                        PostBloc.get(context).users[index].imageUrl
                                    ) ,
                                    backgroundColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 2*SizeConfig.blockSizeHorizontal,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( PostBloc.get(context).users[index].name,

                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Text("20m . ",
                                            style: TextStyle(
                                                color: Colors.grey[600]
                                            ),),
                                          Icon(Icons.public,
                                            color: Colors.grey[600],
                                            size: 12,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: SizeConfig.safeBlockVerticalWithAppBar*1,)
                                    ],
                                  )

                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.safeBlockVerticalWithAppBar*1,),
                            Column(
                              children: [
                                PostBloc.get(context).posts[index].image.isEmpty ?
                                Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2.0
                                      ,top: SizeConfig.safeBlockVerticalWithAppBar*0.5,bottom : SizeConfig.safeBlockHorizontal*2.0),
                                  child:  Text(PostBloc.get(context).posts[index].content),
                                ):
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2.0
                                          ,top: SizeConfig.safeBlockVerticalWithAppBar*0.5,bottom : SizeConfig.safeBlockHorizontal*2.0),
                                      child:  Text(PostBloc.get(context).posts[index].content),
                                    ),
                                    Image.asset(PostBloc.get(context).posts[index].image[0])
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.safeBlockVerticalWithAppBar*1,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    children :[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:  EdgeInsets.only(left:SizeConfig.safeBlockVerticalWithAppBar*1) ,
                                          child: Row(
                                            children: [
                                              Image.asset("assets/sad2.png",
                                                width: SizeConfig.safeBlockHorizontal*1,
                                                height: SizeConfig.safeBlockVerticalWithAppBar*1,),
                                              SizedBox(width: SizeConfig.safeBlockHorizontal*1,),

                                              Text("52"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:EdgeInsets.only(right: SizeConfig.safeBlockVerticalWithAppBar*2) ,
                                          child: Row(
                                            children: [
                                              Text("81") ,
                                              SizedBox(width: SizeConfig.safeBlockHorizontal*1,),
                                              Text("Comments"),
                                              SizedBox(width: SizeConfig.safeBlockHorizontal*2,),
                                              Text("81") ,
                                              SizedBox(width: SizeConfig.safeBlockHorizontal*1,),
                                              Text("Shares")
                                            ],
                                          ),
                                        ),
                                      ),

                                    ]

                                ),
                                Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical:SizeConfig.safeBlockHorizontal*2,horizontal:SizeConfig.safeBlockHorizontal*2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 25,
                                        child: Row(
                                          children: [
                                            FlutterReactionButtonCheck(
                                              boxAlignment: Alignment.topCenter,
                                              onReactionChanged: (reaction, index, isChecked) {
                                                print('reaction selected index: $index');
                                              },
                                              reactions: Example.reactions,
                                              initialReaction: Reaction(
                                                icon: Container(
                                                  height: 25,
                                                  child: Padding(
                                                    padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2),
                                                    child: Row(
                                                      children: [
                                                        new Icon (MdiIcons.thumbUpOutline,
                                                          color: Colors.grey[600],
                                                          size: 20,
                                                        ),
                                                        SizedBox(width: SizeConfig.safeBlockHorizontal*1,
                                                        ),
                                                        Text("Like"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              boxRadius: 20,
                                              boxDuration: Duration(milliseconds: 500),
                                            ),
                                            // new Icon (MdiIcons.thumbUpOutline,
                                            // color: Colors.grey[600],
                                            // size: 20,
                                            // ),
                                            // SizedBox(width: 2,
                                            // ),
                                            // Text("Like"),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2),
                                          child: Row(
                                            children: [
                                              new Icon (MdiIcons.commentOutline,
                                                color: Colors.grey[600],
                                                size: 20,
                                              ),
                                              SizedBox(width: SizeConfig.safeBlockHorizontal*1,
                                              ),
                                              Text("Comment"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal*2),
                                          child: Row(
                                            children: [
                                              new Icon (MdiIcons.shareOutline,
                                                color: Colors.grey[600],
                                                size: 20,
                                              ),
                                              SizedBox(width: SizeConfig.safeBlockHorizontal*1,
                                              ),
                                              Text("Share"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 4),

                      );
                    },
                    childCount: 5,
                  ),

                )
              ]
          )

        ),
        Container(
          color: Colors.orange,
          width: SizeConfig.safeBlockHorizontal*25,

        ),

      ],
    );

  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return BlocProvider(
      create: (BuildContext context) => PostBloc() ,
      child: BlocConsumer <PostBloc,PostStates>(
          listener: (context,state){
          },
          builder:(context,state) {
            if (PostBloc.get(context).allLoaded){
              return Scaffold(
                body: appbar(context),
              );
            }
            else{
              Future.delayed(const Duration(seconds:2 ), () async {
                await PostBloc.get(context).initializeUsers();
                await PostBloc.get(context).initializePosts();
                allLoaded = true ;
                PostBloc.get(context).changeStatus() ;

                print (PostBloc.get(context).posts);

              });
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size(SizeConfig.safeBlockHorizontal,SizeConfig.safeBlockVerticalWithAppBar*10),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          "Facebook",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                body: Splash (),
              );
            }
          }

      ),

    );



  }

}
/*


SliverAppBar(
                  stretch: true,
                  elevation: 0,
                  title: Text(
                    "Facebook",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  floating: true,
                  actions: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape:BoxShape.circle
                      ),
                      child: IconButton(
                        iconSize: 30,
                        color: Colors.black,
                        icon :Icon(Icons.search),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape:BoxShape.circle
                      ),
                      child: IconButton(
                        iconSize: 30,
                        color: Colors.black,
                        icon: new Icon (MdiIcons.facebookMessenger),
                        onPressed: () {  },
                      ),
                    ),
                  ],
                ),

 */