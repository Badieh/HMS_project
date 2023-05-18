import 'package:get/get.dart';
import 'package:hospital/network/bindings/doctor_main_binding.dart';
import 'package:hospital/presentation/screens/auth/fill_profile.dart';
import 'package:hospital/presentation/screens/auth/login.dart';
import 'package:hospital/presentation/screens/auth/register.dart';
import 'package:hospital/presentation/screens/book_appointments/book_appointments.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/layout/doctor_layout.dart';
import 'package:hospital/presentation/screens/doctors/doctor_details.dart';
import 'package:hospital/presentation/screens/doctors/doctors.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';
import 'package:hospital/presentation/screens/layout/view/favourite/favourite_screen.dart';
import 'package:hospital/presentation/screens/layout/view/notification.dart';
import 'package:hospital/presentation/screens/layout/view/profile.dart';
import 'package:hospital/presentation/screens/layout/view/search/search.dart';
import 'package:hospital/presentation/screens/specializations/specializations.dart';
import 'package:hospital/presentation/screens/splash/onBoarding.dart';
import 'package:hospital/presentation/screens/splash/splash.dart';

class AppRoutes {
  static const splashScreen = Routes.splashScreen;
  static const doctorHomeScreen = Routes.doctorHomeScreen;

  static final routes = [
    GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
    GetPage(
      name: Routes.homeLayoutScreen,
      page: () => HomeLayoutScreen(),
    ),
    GetPage(name: Routes.notificationScreen, page: () => NotificationScreen()),
    GetPage(name: Routes.searchScreen, page: () => Search_Screen()),
    GetPage(name: Routes.favouriteScreen, page: () => FavouriteScreen()),
    GetPage(name: Routes.fillProfile, page: () => FillProfileScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen()),
    GetPage(name: Routes.specializations, page: () => SpecializationsScreen()),
    GetPage(name: Routes.doctors, page: () => DoctorsScreen()),
    GetPage(name: Routes.onBoarding, page: () => OnBoardingScreen()),
    GetPage(
      name: Routes.profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
        name: Routes.bookAppointment,
        page: () => BookAppointmentScreen(
              title: '',
            )),
    GetPage(name: Routes.doctorDetails, page: () => DoctorDetailsScreen()),
    GetPage(
        name: Routes.doctorHomeScreen,
        page: () => DoctorLayoutScreen(),
        bindings: [
          DoctorMainBinding(),
        ]),
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
  static const profile = '/profile';

  static const bookAppointment = '/bookAppointment';
  static const doctorDetails = '/doctorDetails';
  static const doctorHomeScreen = '/doctorHomeScreen';
}
