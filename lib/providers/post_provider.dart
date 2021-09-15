import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsfeed/models/post.dart';
import 'package:flutter_newsfeed/models/user.dart';
import 'package:flutter_newsfeed/providers/post_states.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:math';



class PostBloc extends Cubit<PostStates>{
  PostBloc() : super (InitState());

  static PostBloc get (context) => BlocProvider.of(context) ;

  bool allLoaded = false  ;

  List <Post> posts  = [] ;
  List <User> users = [] ;
  List <String> images = ["assets/man.png", "assets/man2.png", "assets/anime.png",
    "assets/man3.png", ] ;
  List<String> names = ["Hatem Mamdoh" , "Mohamed Gamal" ,"Hazem Imam","Ahmed Mohamed"];

  Future<void> addUsers () async {
    User user = new User("Hatem Mamdoh", "assets/man.png") ;
    User user1 = new User("Mohamed Gamal", "assets/man2.png") ;
    User user2 = new User("Ahmed Mohamed", "assets/anime.png") ;
    users.add(user) ;
    users.add(user1) ;
    users.add(user2) ;
  }
  String makeString (){
    return("messi messi messi messi messi messi messi messi messi messi messi messi "
        "messi messi messi messi messi messi messi messi "
        "messi messi messi messi messi messi messi "
        "messi messi messi messi messi messi  messi messi ") ;
  }
  Future<void> initializePosts()  async {
    for (int i = 0 ; i < 5 ; i++){
      Random random = new Random();
      int randomNumber = random.nextInt(3);
      Post p ;
      List <String> contents = [] ;
      if (randomNumber == 1){
      }
      else if (randomNumber == 2){
        contents.add("assets/messi2.jpg") ;
      }

      int userIndex = random.nextInt(users.length);
      p = new Post(makeString (), contents  , 10 ,15,9, users[userIndex]);
      posts.add(p) ;
    }
    emit(imageLoaded()) ;
  }
  void initializeStories(){

  }
  Future<void> initializeUsers()async{
    Random random = new Random();
    for (int i = 0 ; i < 5;i++){
      int imageIndex = random.nextInt(images.length);
      int nameIndex = random.nextInt(names.length);
      User u = new User(names[nameIndex], images[imageIndex]) ;
      users.add(u) ;
    }

  }
  void changeStatus (){
    allLoaded = true ;
    emit(Loaded ()) ;
  }
  void changeLikeStatus (Post p){
    print ("Here") ;
    if (!p.isLiked){
      p.numberOfLikes ++ ;
    }
    else {
      p.numberOfLikes-- ;
    }
    p.isLiked = !p.isLiked ;
    print (p.numberOfLikes) ;
    emit(ChangeLikesNumber ()) ;

  }
}