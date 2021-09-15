import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQuerryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeBlockVerticalWithAppBar;
  static late double safeBlockHorizontal;
  static late double safeBlockVerticalWithOutAppBar;
  static late double allAppHaveAppBar;

  void init(BuildContext context) {
    _mediaQuerryData = MediaQuery.of(context);
    screenWidth = _mediaQuerryData.size.width;
    screenHeight = _mediaQuerryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQuerryData.padding.left + _mediaQuerryData.padding.right;
    safeAreaVertical =
        _mediaQuerryData.padding.top + _mediaQuerryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVerticalWithAppBar =
        (screenHeight - safeAreaVertical - AppBar().preferredSize.height) / 100;
    safeBlockVerticalWithOutAppBar =
        (screenHeight - safeAreaVertical - 0) / 100;
    allAppHaveAppBar =
        (screenHeight - safeAreaVertical - AppBar().preferredSize.height) / 100;
  }
}
