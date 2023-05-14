import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/main.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/faq_screen.dart';
import 'package:sosko/view/screen/language_screen.dart';
import 'package:sosko/view/screen/profile_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsScreen extends KFDrawerContent {
  SettingsScreen({Key key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding:
                EdgeInsets.only(left: DimensionScreen.getWidth(context, 24)),
            child: InkWell(
                onTap: () =>
                    context.nextReplacementPage(BottomNavigationScreen()),
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Text(
            'Settings',
            style: KTextStyle.headline3.copyWith(fontSize: 20),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: KColor.white,
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 39)),
              Text('Account',
                  style: KTextStyle.body2
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 16)),
              SizedBox(height: DimensionScreen.geHeight(context, 19)),
              InkWell(
                onTap: () {
                  context.nextReplacementPage(ProfileScreen());
                },
                child: Container(
                  height: DimensionScreen.geHeight(context, 50),
                  child: Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Image.asset(
                          'assets/images/man.png',
                          height: DimensionScreen.geHeight(context, 50),
                          width: DimensionScreen.getWidth(context, 50),
                        ),
                      ),
                      SizedBox(width: DimensionScreen.getWidth(context, 19)),
                      Padding(
                        padding: EdgeInsets.only(
                            top: DimensionScreen.geHeight(context, 10)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text('Yasin Rahib',
                                    style: KTextStyle.subtitle2)),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('Personal Info',
                                  style: KTextStyle.body2.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset('assets/images/btn.png')))
                    ],
                  ),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 39)),
              Text('Settings',
                  style: KTextStyle.body2
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 16)),
              SizedBox(height: DimensionScreen.geHeight(context, 19)),
              InkWell(
                onTap: () {
                  navigatorKey.currentState.pushReplacement(
                      MaterialPageRoute(builder: (_) => LanguageScreen()));
                },
                child: Container(
                  height: DimensionScreen.geHeight(context, 50),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Icon.png'),
                      SizedBox(width: DimensionScreen.getWidth(context, 19)),
                      FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Language', style: KTextStyle.subtitle2)),
                      SizedBox(width: DimensionScreen.getWidth(context, 132)),
                      Text('EN',
                          style: KTextStyle.body2.copyWith(
                              fontSize: 12, fontWeight: FontWeight.normal)),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset('assets/images/btn.png')))
                    ],
                  ),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 30)),
              Container(
                height: DimensionScreen.geHeight(context, 50),
                child: Row(
                  children: [
                    Image.asset('assets/images/in.png'),
                    SizedBox(width: DimensionScreen.getWidth(context, 19)),
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child:
                            Text('Notification', style: KTextStyle.subtitle2)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/images/btn.png')))
                  ],
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 30)),
              Container(
                height: DimensionScreen.geHeight(context, 50),
                child: Row(
                  children: [
                    Image.asset('assets/images/dark.png'),
                    SizedBox(width: DimensionScreen.getWidth(context, 19)),
                    FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Dark Mode', style: KTextStyle.subtitle2)),
                    Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              //activeTrackColor: KColor.tertiary,
                              activeColor: KColor.tertiary,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 30)),
              Container(
                height: DimensionScreen.geHeight(context, 50),
                child: Row(
                  children: [
                    Image.asset('assets/images/ii.png'),
                    SizedBox(width: DimensionScreen.getWidth(context, 19)),
                    Text('Help', style: KTextStyle.subtitle2),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () => navigatorKey.currentState
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) => FAQScreen())),
                                child: Image.asset('assets/images/btn.png'))))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
