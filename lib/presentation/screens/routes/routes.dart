

import 'package:get/get.dart';
import 'package:hospital/presentation/screens/layout/view/notification.dart';
import 'package:hospital/presentation/screens/splash/splash.dart';

class AppRoutes {
  static const SplashScreen = Routes.SplashScreen;
  static final routes = [
    GetPage(
        name: Routes.notificationScreen,
        page: () => NotificationScreen()
    ),

  ];
}

class Routes {

  static const SplashScreen = '/SplashScreen';
  static const welcomeView = '/welcomeView';
  static const notificationScreen = '/notificationScreen';



}
