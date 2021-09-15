import 'package:flutter_newsfeed/models/user.dart';

class Stories{

  late User user ;
  late String imageUrl ;

  Stories(User user, String imageUrl){
    this.user = user ;
    this.imageUrl =imageUrl;

  }
}