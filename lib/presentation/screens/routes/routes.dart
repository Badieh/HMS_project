

import 'package:get/get.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';
import 'package:hospital/presentation/screens/layout/view/favourite/favourite_screen.dart';
import 'package:hospital/presentation/screens/layout/view/notification.dart';
import 'package:hospital/presentation/screens/layout/view/search/search.dart';
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
    GetPage(
        name: Routes.searchScreen,
        page: () => Search_Screen()
    ),
    GetPage(
        name: Routes.favouriteScreen,
        page: () => FavouriteScreen()
    ),
  ];
}

class Routes {

  static const splashScreen = '/splashScreen';
  static const welcomeView = '/welcomeView';
  static const homeLayoutScreen = '/homeLayoutScreen';
  static const searchScreen = '/searchScreen';
  static const notificationScreen = '/notificationScreen';
  static const favouriteScreen = '/favouriteScreen';



}
