import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DimensionScreen {
  static double getWidth(BuildContext context, width) {
    double _width = (((100 / 375) * width) / 100) * context.screenWidth;
    //print(_width);
    return _width;
  }

  static double geHeight(BuildContext context, height) {
    double _height = (((100 / 812) * height) / 100) * context.screenHeight;
    //print(_height);
    return _height;
  }
}
