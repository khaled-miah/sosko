import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sosko/view/screen/onboard_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: -DimensionScreen.getWidth(context, 69),
              top: -DimensionScreen.geHeight(context, 69),
              child: Container(
                height: DimensionScreen.geHeight(context, 139),
                width: DimensionScreen.getWidth(context, 139),
                decoration: BoxDecoration(
                    color: KColor.tertiary,
                    borderRadius: BorderRadius.circular(70)),
              ),
            ),
            Positioned(
              top: DimensionScreen.geHeight(context, 331),
              child: Container(
                height: DimensionScreen.geHeight(context, 76),
                width: DimensionScreen.getWidth(context, 76),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: KColor.tertiary.withOpacity(0.3),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ],
                    color: KColor.tertiary),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ),
            Positioned(
              top: DimensionScreen.geHeight(context, 417),
              child: Center(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: DimensionScreen.geHeight(context, 10)),
                      child: Text(
                        'SOSKO',
                        style: KTextStyle.headline1,
                      ))),
            ),
            Positioned(
              right: -DimensionScreen.getWidth(context, 69),
              bottom: -DimensionScreen.geHeight(context, 69),
              child: Container(
                height: DimensionScreen.geHeight(context, 139),
                width: DimensionScreen.getWidth(context, 139),
                decoration: BoxDecoration(
                  color: KColor.tertiary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
