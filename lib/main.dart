import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/global_widgets/class_builder.dart';
import 'package:sosko/view/global_widgets/drawer_screen.dart';
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
import 'package:sosko/view/style/k_color.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'Mulish',
        accentColor: KColor.tertiary,
      ),
      home: SplashScreen(),
      //SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/splashScreen': (BuildContext context) => SplashScreen(),
        '/onboardScreen': (BuildContext context) => OnBoardScreen(),
        '/loginScreen': (BuildContext context) => LogInScreen(),
        '/signupScreen': (BuildContext context) => SignUpScreen(),
        '/verificationScreen': (BuildContext context) => VerificationScreen(),
        '/homeScreen': (BuildContext context) => HomeScreen(),
        '/detailsScreen': (BuildContext context) => DetailsScreen(),
        '/cartScreen': (BuildContext context) => CartScreeen(),
        '/checkoutScreen': (BuildContext context) => CheckOutScreen(),
        '/favoriteScreen': (BuildContext context) => FavoritesScreen(),
        '/allItemScreen': (BuildContext context) => AllItemsScreen(),
        '/searchScreen': (BuildContext context) => SearchScreen(),
        '/scanScreen': (BuildContext context) => ScanScreen(),
        '/historyScreen': (BuildContext context) => HistoryScreen(),
        '/orderTrackingScreen': (BuildContext context) => OrderTrackingScreen(),
        '/settingsScreen': (BuildContext context) => SettingsScreen(),
        '/profileScreen': (BuildContext context) => ProfileScreen(),
        '/faqScreen': (BuildContext context) => FAQScreen(),
        '/languageScreen': (BuildContext context) => LanguageScreen(),
        '/bottomNavScreen': (BuildContext context) => BottomNavigationScreen(),
      },
    );
  }
}
