import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_cubit.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_1.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_2.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_3.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/layout.dart';

class FillProfileScreen extends StatelessWidget {
  FillProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDataCubit, ProfileDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileDataCubit cubit = ProfileDataCubit().get(context);
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
                        onPressed: () {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeLayoutScreen(),
                                  ));
                            }
                          }
                          // if (cubit.pageController.page == 0) {
                          //   cubit.nextPage();
                          // } else if (cubit.pageController.page == 1) {
                          //   cubit.nextPage();
                          // } else if (cubit.pageController.page == 2) {
                          //   cubit.nextPage();
                          // } else if (cubit.pageController.page == 3) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => HomeLayoutScreen(),
                          //       ));
                          // }
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
