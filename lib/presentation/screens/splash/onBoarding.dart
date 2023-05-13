import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hospital/models/on_boarding_model.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/register.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late List<OnBoardingModel> onBoarding;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page!.toInt();
      });
    });

    onBoarding = [
      const OnBoardingModel(
          url: ImageAssets.onBoardingLogo1, title: AppStrings.onBoardingTitle1),
      const OnBoardingModel(
          url: ImageAssets.onBoardingLogo2, title: AppStrings.onBoardingTitle2),
      const OnBoardingModel(
          url: ImageAssets.onBoardingLogo3, title: AppStrings.onBoardingTitle3),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSizeHeight.s570,
                child: PageView.builder(
                  itemCount: onBoarding.length,
                  //pageSnapping: false,
                  padEnds: false,
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {},
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FittedBox(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: 1, minHeight: 1),
                              child: SvgPicture.asset(
                                onBoarding[index].url,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 45,
                          // ),
                          Container(
                            width: AppSizeWidth.s320,
                            child: Text(
                              textAlign: TextAlign.center,
                              onBoarding[index].title,
                              style: TextStyle(
                                  fontSize: FontSize.s30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //SizedBox(height: MediaQuery.of(context).size.height / 45),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: AppConstants.obBoardingSlides,
                    effect: WormEffect(
                      dotHeight: AppSizeHeight.s16,
                      dotWidth: AppSizeWidth.s16,
                      activeDotColor: ColorManager.primary,
                      strokeWidth: AppSizeWidth.s4,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(AppSizeWidth.s80, AppSizeHeight.s40)),
                      onPressed: () {
                        if (_currentPage != 2) {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        } else if (_currentPage == 2) {
                          Get.offAllNamed(Routes.login);

                          // controller.animateToPage(0,
                          //     duration: const Duration(milliseconds: 200),
                          //     curve: Curves.easeIn);
                        }
                      },
                      child: Text(
                        _currentPage == 2 ? AppStrings.skip : AppStrings.next,
                        //style: Theme.of(context).textTheme.bodySmall,
                      ))
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height / 45),
            ],
          ),
        ),
      ),
    );
  }
}
