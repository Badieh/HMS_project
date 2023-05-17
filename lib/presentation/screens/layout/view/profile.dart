import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/network/controller/dark_mode_controller.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;

import '../../routes/routes.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
    final darkModeControler = Get.find<DarkModeController>();
   final darkMode = 'Dark Mode'.obs;
   final lightMode = "Light Mode".obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // profile data =======
            Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizeHeight.s70),
                    color: Get.isDarkMode
                        ? ColorManager.lightBlack
                        : ColorManager.white,
                  ),
                  width: AppSizeWidth.s120,
                  height: AppSizeHeight.s120,
                  child: flutter_blurhash.BlurHash(
                    image: AppConstants.adminStorage.read('patientPP'),
                    hash: imageHash,
                    duration: const Duration(milliseconds: 500),
                    imageFit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: AppSizeHeight.s8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.adminStorage.read('fullName'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: FontSize.s18),
                    ),
                    Text(
                      AppConstants.adminStorage.read('email'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: FontSize.s14),
                    ),
                  ],
                ),
                Divider(
                  color: ColorManager.grey2,
                  thickness: 1,
                  height: 60,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.person_2_outlined,
                        size: AppSizeHeight.s25,
                        color: ColorManager.primary,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: FontSize.s18),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: AppSizeWidth.s18,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.notificationScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.notifications_active_outlined,
                          size: AppSizeHeight.s25,
                          color: ColorManager.primary,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Notification",
                        style: TextStyle(fontSize: FontSize.s18),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: AppSizeWidth.s18,
                  )
                ],
              ),
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * .02,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         Container(
            //           height: 40,
            //           width: 40,
            //           child: Icon(
            //             Icons.language,
            //             size: AppSizeHeight.s25,
            //             color: ColorManager.primary,
            //           ),
            //           clipBehavior: Clip.antiAlias,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(50)),
            //         ),
            //         Text(
            //           "Language",
            //           style: TextStyle(fontSize: FontSize.s18),
            //         ),
            //       ],
            //     ),
            //     Icon(
            //       Icons.arrow_forward_ios_outlined,
            //       size: AppSizeWidth.s18,
            //     )
            //   ],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Get.isDarkMode? Icons.dark_mode_outlined: Icons.sunny,
                        size: AppSizeHeight.s25,
                        color: ColorManager.primary,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text(
                       Get.isDarkMode? darkMode.value : lightMode.value,
                      style: TextStyle(fontSize: FontSize.s18),
                    ),
                  ],
                ),
                 Switch(

                    value: darkModeControler.switchValue.value,
                    onChanged: (value) {
                      darkModeControler.changeTheme();
                      darkModeControler.switchValue.value = value;
                    },
                      activeColor: ColorManager.primary,
                      inactiveThumbColor: ColorManager.grey,
                      inactiveTrackColor: ColorManager.lightGrey
                  ),
              ],
            ),),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            InkWell(
              onTap: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,

                  backgroundColor:
                      Get.isDarkMode ? ColorManager.lightBlack : ColorManager.white,
                  titleColor:
                      Get.isDarkMode ? ColorManager.white : ColorManager.black,
                  textColor:
                      Get.isDarkMode ? ColorManager.white : ColorManager.black,
                  confirmBtnColor: ColorManager.error,
                  confirmBtnTextStyle: TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold
                  ),
                  cancelBtnText: AppStrings.cancel,
                  confirmBtnText: AppStrings.confirm,
                  onCancelBtnTap: () {
                    Get.back();
                  },
                  onConfirmBtnTap: () async {
                    await darkModeControler.logout();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons.logout,
                            size: AppSizeHeight.s25, color: ColorManager.error),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        AppStrings.logout,
                        style: TextStyle(
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
