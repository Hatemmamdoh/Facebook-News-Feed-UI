import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

final defaultInitialReaction = Reaction(
  icon: Text('No raction'),
);

final reactions = [
  Reaction(
    title: _buildTitle('Like'),
    previewIcon: _buildReactionsPreviewIcon('assets/like.gif'),
    icon: _buildReactionsIcon(
      'assets/ic_like_fill.png',
      Text(
        'Like',
        style: TextStyle(
          color: Color(0XFF3b5998),
        ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('Love'),
    previewIcon: _buildReactionsPreviewIcon('assets/love.gif'),
    icon: _buildReactionsIcon(
      'assets/love2.png',
      Text(
        'Love',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('WOW'),
    previewIcon: _buildReactionsPreviewIcon('assets/wow.gif'),
    icon: _buildReactionsIcon(
      'assets/wow2.png',
      Text(
        'Wow',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('haha'),
    previewIcon: _buildReactionsPreviewIcon('assets/haha.gif'),
    icon: _buildReactionsIcon(
      'assets/haha2.png',
      Text(
        'haha',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('Sad'),
    previewIcon: _buildReactionsPreviewIcon('assets/sad.gif'),
    icon: _buildReactionsIcon(
      'assets/sad2.png',
      Text(
        'Sad',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction(
    title: _buildTitle('Angry'),
    previewIcon: _buildReactionsPreviewIcon('assets/angry.gif'),
    icon: _buildReactionsIcon(
      'assets/angry2.png',
      Text(
        'Angry',
        style: TextStyle(
          color: Color(0XFFed5168),
        ),
      ),
    ),
  ),

];

Widget _builFlagsdPreviewIcon(String path, String text) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  child: Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 7.5),
      Image.asset(path, height: 30),
    ],
  ),
);

Widget _buildTitle(String title) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
  decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Text(
    title,
    style: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  ),
);

Widget _buildReactionsPreviewIcon(String path) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
  child: Image.asset(path, height: 40),
);



Widget _buildReactionsIcon(String path, Text text) => Container(
  color: Colors.transparent,
  child: Row(
    children: <Widget>[
      Image.asset(path, height: 20),
      const SizedBox(width: 5),
      text,
    ],
  ),
);
