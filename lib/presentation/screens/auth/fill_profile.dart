import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_states.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_1.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_2.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_3.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_4.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FillProfileScreen extends StatelessWidget {
  FillProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);

        if (state is CreatePatientSuccessfulState &&
            AppConstants.adminStorage.read('patientId') != null) {
          // navigate and show success
          Get.offAllNamed(Routes.homeLayoutScreen);
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: cubit.patientModel?.message,
              backgroundColor:
                  Get.isDarkMode ? ColorManager.black : ColorManager.white,
              titleColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.black,
              textColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.black,
              confirmBtnColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.primary,
              confirmBtnTextStyle: TextStyle(
                color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
              ));
        } else if (state is CreatePatientErrorState) {
          // show error
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: cubit.errorModel!.message,
              backgroundColor:
                  Get.isDarkMode ? ColorManager.black : ColorManager.white,
              titleColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.black,
              textColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.black,
              confirmBtnColor:
                  Get.isDarkMode ? ColorManager.white : ColorManager.primary,
              confirmBtnTextStyle: TextStyle(
                color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
              ));
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
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
                    padEnds: false,
                    controller: cubit.pageController,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      cubit.changePage(index);
                    },
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //         fixedSize:
                    //             Size(AppSizeWidth.s80, AppSizeHeight.s20)),
                    //     onPressed: () {
                    //       cubit.previousPage();
                    //     },
                    //     child: const Text(
                    //       AppStrings.back,
                    //       //style: Theme.of(context).textTheme.bodySmall,
                    //     )),
                    SmoothPageIndicator(
                      controller: cubit.pageController,
                      count: 4,
                      effect: ExpandingDotsEffect(
                        //type: SwapType.yRotation,
                        dotHeight: AppSizeHeight.s16,
                        dotWidth: AppSizeWidth.s16,
                        activeDotColor: ColorManager.primary,
                        strokeWidth: AppSizeWidth.s4,
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(AppSizeWidth.s80, AppSizeHeight.s20)),
                        onPressed: () async {
                          if (cubit.pageController.page == 0) {
                            if (ProfileData1Screen.formKey1.currentState!
                                .validate()) {
                              cubit.nextPage();
                            }
                          } else if (cubit.pageController.page == 1) {
                            if (ProfileData2Screen.formKey2.currentState!
                                .validate()) {
                              cubit.nextPage();
                            }
                          } else if (cubit.pageController.page == 2) {
                            if (ProfileData3Screen.formKey3.currentState!
                                .validate()) {
                              cubit.nextPage();
                            }
                          } else if (cubit.pageController.page == 3) {
                            if (ProfileData4Screen.formKey4.currentState!
                                .validate()) {
                              await cubit.submitProfileData(context: context);
                            }
                          }
                        },
                        child: Text(
                          !cubit.endReached
                              ? AppStrings.next
                              : AppStrings.submit,
                          //style: Theme.of(context).textTheme.bodySmall,
                        ))
                  ],
                ),
              ],
            ),
          ),
          // floatingActionButton: cubit.pageController.page != 3
          //     ? FloatingActionButton(
          //         onPressed: () {
          //           cubit.nextPage();
          //         },
          //         child: Text('next'),
          //       )
          //     : FloatingActionButton(
          //         onPressed: () {},
          //         child: Text('submit'),
          //       ),
        );
      },
    );
  }
}
