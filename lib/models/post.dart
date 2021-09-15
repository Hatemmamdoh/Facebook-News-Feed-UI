import 'package:flutter_newsfeed/models/user.dart';

class Post {

 String content = "" ;
 List <String> image = [] ;
 late int numberOfLikes ;
 late int numberOfShares ;
 late int numberOfComments ;
 late User user ;
 late bool isLiked = false ;

  Post(String s, List <String> t , int numberOfLikes,int numberOfComments,numberOfShares, User user){
   this.content = s ;
   this.image = t ;
   this.numberOfLikes = numberOfLikes ;
   this.numberOfComments =numberOfComments;
   this.numberOfShares = numberOfShares ;
   this.user = user ;
  }
}