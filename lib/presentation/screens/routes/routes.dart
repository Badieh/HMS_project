

import 'package:get/get.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';
import 'package:hospital/presentation/screens/layout/view/notification.dart';
import 'package:hospital/presentation/screens/splash/splash.dart';

class AppRoutes {
  static const splashScreen = Routes.splashScreen;
  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => SplashScreen()
    ),
    GetPage(
        name: Routes.homeLayoutScreen,
        page: () => HomeLayoutScreen()
    ),
    GetPage(
        name: Routes.notificationScreen,
        page: () => NotificationScreen()
    ),
  ];
}

class Routes {

  static const splashScreen = '/splashScreen';
  static const welcomeView = '/welcomeView';
  static const notificationScreen = '/notificationScreen';
  static const homeLayoutScreen = '/homeLayoutScreen';



}
