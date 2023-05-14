

import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/faq_screen.dart';
import 'package:sosko/view/screen/history_screen.dart';
import 'package:sosko/view/screen/home_screen.dart';
import 'package:sosko/view/screen/order_tracking_screen.dart';
import 'package:sosko/view/screen/settings_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<BottomNavigationScreen>(() => BottomNavigationScreen());
    register<BottomNavigationScreen>(() => BottomNavigationScreen());
    register<HistoryScreen>(() => HistoryScreen());
    register<OrderTrackingScreen>(() => OrderTrackingScreen());
    register<FAQScreen>(() => FAQScreen());
    register<SettingsScreen>(() => SettingsScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}