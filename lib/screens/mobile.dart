import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsfeed/providers/post_provider.dart';
import 'package:flutter_newsfeed/providers/post_states.dart';
import 'package:flutter_newsfeed/screens/splash_screen.dart';
import 'package:flutter_newsfeed/utils/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'test.dart' as Example;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MobileScreen extends StatelessWidget {
  bool allLoaded = false ;
  Random random = new Random();


  Widget appbar (context){
    int imagesLength = PostBloc.get(context).images.length ;
    return CustomScrollView(
      slivers: <Widget>[
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
        SliverToBoxAdapter(
          child: Container(
            height: 18*SizeConfig.safeBlockVerticalWithAppBar,
            color: Colors.white,
            child: Column(
              children: [
                Divider(
                  height: 8,
                  thickness: 0.6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            PostBloc.get(context).images[random.nextInt(imagesLength)]),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal*2,
                    ),
                    Container(
                      width: 40*SizeConfig.blockSizeHorizontal,
                      child: TextField(
                        decoration: new InputDecoration.collapsed(
                            hintText: "What's in your mind?",
                            // hintStyle: TextStyle(color : Colors.black),
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
                    FlatButton.icon(onPressed: (){},
                        icon: Icon(Icons.videocam,
                          color: Colors.pink,
                        ),
                        label: Text("Live"),

                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 5,
                    ),
                    FlatButton.icon(onPressed: (){},
                      icon: Icon(Icons.photo_library,
                        color: Colors.greenAccent,
                      ),
                      label: Text("Photo")
                    ),
                    VerticalDivider(
                      width: 5,
                    ),
                    FlatButton.icon(onPressed: (){},
                      icon: Icon(Icons.video_call,
                        color: Colors.purple,
                      ),
                      label: Text("Room"),
                    ),
                  ],
                )
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
                    child: Image.asset(PostBloc.get(context).images[index],
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
                        backgroundImage:AssetImage(
                          PostBloc.get(context).images[random.nextInt(imagesLength)]
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
                                  padding:  EdgeInsets.only(left:SizeConfig.safeBlockVerticalWithAppBar*2) ,
                                    child: Row(
                                      children: [
                                        Image.asset("assets/sad2.png",
                                          width: SizeConfig.safeBlockHorizontal*5,
                                          height: SizeConfig.safeBlockVerticalWithAppBar*5,),
                                        SizedBox(width: SizeConfig.safeBlockHorizontal*1,),

                                         Text(PostBloc.get(context).posts[index].numberOfLikes.toString()),
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
                                      Text(PostBloc.get(context).posts[index].numberOfComments.toString()) ,
                                      SizedBox(width: SizeConfig.safeBlockHorizontal*1,),
                                      Text("Comments"),
                                      SizedBox(width: SizeConfig.safeBlockHorizontal*2,),
                                      Text(PostBloc.get(context).posts[index].numberOfShares.toString()) ,
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
                                        InkWell (
                                          onTap: (){
                                            print ("here");
                                          },
                                          child: FlutterReactionButtonCheck(
                                            boxAlignment: Alignment.topCenter,
                                            onReactionChanged: (reaction, index, isChecked) {
                                              PostBloc.get(context).changeLikeStatus(PostBloc.get(context).posts[index]) ;

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
                                                        InkWell (
                                                          onTap: (){
                                                          }
                                                          ,child: new Icon (MdiIcons.thumbUpOutline,
                                                            color: Colors.grey[600],
                                                            size: 20,
                                                          ),
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
              body: Splash (),
            );
          }
        }

      ),

        );



  }

}