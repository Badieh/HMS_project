import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_1.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_2.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_3.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_4.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FillProfileScreen extends StatefulWidget {
  FillProfileScreen({Key? key}) : super(key: key);

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.fillYourProfile),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                //pageSnapping: false,
                padEnds: false,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {},
                children: [
                  ProfileData1Screen(),
                  ProfileData2Screen(),
                  ProfileData3Screen(),
                  ProfileData4Screen(),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
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
                      // if (controller.page == 0) {
                      //   if (formKey1.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // } else if (controller.page == 1) {
                      //   if (formKey2.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // } else if (controller.page == 2) {
                      //   if (formKey3.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // } else if (controller.page == 3) {
                      //   if (formKey4.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // }
                      if (controller.page == 0) {
                        nextPage();
                      } else if (controller.page == 1) {
                        nextPage();
                      } else if (controller.page == 2) {
                        nextPage();
                      } else if (controller.page == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeLayoutScreen(),
                            ));
                      }
                    },
                    child: const Text(
                      AppStrings.next,
                      //style: Theme.of(context).textTheme.bodySmall,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
  }
}
