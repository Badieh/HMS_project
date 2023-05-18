import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';

import 'onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    if (GetStorage().read('isLogged') == true) {
      Timer(const Duration(seconds: 3),
          () => Get.offAllNamed(Routes.homeLayoutScreen));
    } else {
      Timer(
          const Duration(seconds: 3), () => Get.offAllNamed(Routes.onBoarding));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? ColorManager.black : ColorManager.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                FadeOut(
                  delay: const Duration(milliseconds: 2400),
                  child: FadeIn(
                    child: SvgPicture.asset(
                      ImageAssets.facultyLogo,
                      width: AppSizeWidth.s150,
                    ),
                  ),
                ),
                FadeOutUp(
                  delay: const Duration(milliseconds: 2400),
                  child: BounceInDown(
                    child: SvgPicture.asset(
                      Get.isDarkMode
                          ? ImageAssets.splashDarkLogo
                          : ImageAssets.splashLightLogo,
                      fit: BoxFit.cover,
                      height: AppSizeHeight.s500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
