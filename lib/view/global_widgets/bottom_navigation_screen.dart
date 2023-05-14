import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/main.dart';
import 'package:sosko/view/screen/all_items_screen.dart';
import 'package:sosko/view/screen/cart_screen.dart';
import 'package:sosko/view/screen/checkout_screen.dart';
import 'package:sosko/view/screen/details_screen.dart';
import 'package:sosko/view/screen/faq_screen.dart';
import 'package:sosko/view/screen/favorites_screen.dart';
import 'package:sosko/view/screen/history_screen.dart';
import 'package:sosko/view/screen/home_screen.dart';
import 'package:sosko/view/screen/language_screen.dart';
import 'package:sosko/view/screen/login_screen.dart';
import 'package:sosko/view/screen/onboard_screen.dart';
import 'package:sosko/view/screen/order_tracking_screen.dart';
import 'package:sosko/view/screen/profile_screen.dart';
import 'package:sosko/view/screen/scan_screen.dart';
import 'package:sosko/view/screen/search_screen.dart';
import 'package:sosko/view/screen/settings_screen.dart';
import 'package:sosko/view/screen/signup_screen.dart';
import 'package:sosko/view/screen/splash_screen.dart';
import 'package:sosko/view/screen/verification_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomNavigationScreen extends KFDrawerContent {
   BottomNavigationScreen({Key key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _selectedItemIndex = 0;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickerImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickerImage != null) {
        _image = File(pickerImage.path);
      } else {
        print('no image selected');
      }
    });
  }

  int _currentIndex = 0;

  final List<Widget> _bottomNavPages = [
    HomeScreen(),
    FavoritesScreen(),
    ScanScreen(),
    SearchScreen(),
    ProfileScreen(),
    CartScreeen(),
    CheckOutScreen(),
    AllItemsScreen(),
    DetailsScreen(),
    FAQScreen(),
    SplashScreen(),
    HistoryScreen(),
    LanguageScreen(),
    LogInScreen(),
    OnBoardScreen(),
    OrderTrackingScreen(),
    SettingsScreen(),
    SignUpScreen(),
    VerificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[_currentIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavBarItem('assets/images/ho.png', 0, true),
                Padding(
                  padding: EdgeInsets.only(
                      right: DimensionScreen.getWidth(context, 36)),
                  child: buildNavBarItem('assets/images/hea.png', 1, false),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: DimensionScreen.getWidth(context, 30)),
                  child: buildNavBarItem('assets/images/se.png', 3, false),
                ),
                buildNavBarItem('assets/images/pro.png', 4, false)
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: context.screenWidth / 2 -
                DimensionScreen.getWidth(context, 62) / 2,
            child: InkWell(
              onTap: () {
                getImage();
                context.nextPage(ScanScreen());
              },
              child: Container(
                height: DimensionScreen.geHeight(context, 62),
                width: DimensionScreen.getWidth(context, 62),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00CC96),
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xff00CC96),
                  child: Image.asset('assets/images/grp.png',
                      height: DimensionScreen.geHeight(context, 18),
                      width: DimensionScreen.getWidth(context, 22)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavBarItem(String image, int index, bool isActive) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          _currentIndex = index;
        });
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: DimensionScreen.geHeight(context, 21),
                bottom: DimensionScreen.geHeight(context, 14),
              ),
              child: Image.asset(
                image,
                height: DimensionScreen.geHeight(context, 18),
                width: DimensionScreen.getWidth(context, 17),
                color: index == _selectedItemIndex
                    ? KColor.tertiary
                    : Color(0xffB2B2B2),
              ),
            ),
            if (_selectedItemIndex == index)
              Container(
                child: Image.asset(
                  'assets/images/hu.png',
                  height: DimensionScreen.geHeight(context, 7),
                  width: DimensionScreen.getWidth(context, 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

 /* Future<bool> moveToLastScreen() {
    navigatorKey.currentState
        .pushNamedAndRemoveUntil('/onboardScreen',
            (Route<dynamic> route) => false);
  //context.nextAndRemoveUntilPage(BottomNavigationScreen());
  }*/
}
