
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String mainRoute = '/main';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String onBoardingRoute = '/onBoarding';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  // static Route<dynamic> getRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case Routes.splashRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const SplashView(),
  //       );
  //     case Routes.onBoardingRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const OnBoardingView(),
  //       );
  //     case Routes.loginRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const LoginView(),
  //       );
  //     case Routes.registerRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const RegisterView(),
  //       );
  //     case Routes.mainRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const MainView(),
  //       );
  //     case Routes.forgetPasswordRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const ForgetPasswordView(),
  //       );
  //     case Routes.storeDetailsRoute:
  //       return MaterialPageRoute(
  //         builder: (_) => const StoreDetailsView(),
  //       );
  //     default:
  //       return unDefinedRoute();
  //   }
  // }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              // appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
              // body: const Text(AppStrings.noRouteFound),
            ));
  }
}
