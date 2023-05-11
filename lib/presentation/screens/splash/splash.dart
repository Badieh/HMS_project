import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
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
    Timer(const Duration(seconds: 3), () => Get.offAllNamed(Routes.onBoarding));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorManager.white,
      body: Center(
        child: FadeOutUp(
          delay: const Duration(milliseconds: 2400),
          child: BounceInDown(
            child: Container(
                color:  ColorManager.white,
                child: SvgPicture.asset(
                  ImageAssets.splashLightLogo,
                  fit: BoxFit.cover,
                  height: AppSizeHeight.s500,
                )),
          ),
        ),
      ),
    );
  }
}
