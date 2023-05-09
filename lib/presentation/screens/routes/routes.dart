import 'package:get/get.dart';
import 'package:hospital/presentation/screens/auth/fill_profile.dart';
import 'package:hospital/presentation/screens/auth/login.dart';
import 'package:hospital/presentation/screens/auth/register.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';
import 'package:hospital/presentation/screens/layout/view/favourite/favourite_screen.dart';
import 'package:hospital/presentation/screens/layout/view/notification.dart';
import 'package:hospital/presentation/screens/layout/view/search/search.dart';
import 'package:hospital/presentation/screens/specializations/specializations.dart';
import 'package:hospital/presentation/screens/splash/onBoarding.dart';
import 'package:hospital/presentation/screens/splash/splash.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctors.dart';

class AppRoutes {
  static const splashScreen = Routes.splashScreen;
  static const specializationsScreen = Routes.specializations;

  static final routes = [
    GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
    GetPage(name: Routes.homeLayoutScreen, page: () => HomeLayoutScreen()),
    GetPage(name: Routes.notificationScreen, page: () => NotificationScreen()),
    GetPage(name: Routes.searchScreen, page: () => Search_Screen()),
    GetPage(name: Routes.favouriteScreen, page: () => FavouriteScreen()),
    GetPage(name: Routes.fillProfile, page: () => FillProfileScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen()),
    GetPage(name: Routes.specializations, page: () => SpecializationsScreen()),
    GetPage(name: Routes.doctors, page: () => TopDoctorsScreen()),
    GetPage(name: Routes.onBoarding, page: () => OnBoardingScreen()),
  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const welcomeView = '/welcomeView';
  static const homeLayoutScreen = '/homeLayoutScreen';
  static const searchScreen = '/searchScreen';
  static const notificationScreen = '/notificationScreen';
  static const favouriteScreen = '/favouriteScreen';
  static const fillProfile = '/fillProfile';
  static const login = '/login';
  static const register = '/register';
  static const specializations = '/specializations';
  static const doctors = '/doctors';
  static const onBoarding = '/onBoading';

}
