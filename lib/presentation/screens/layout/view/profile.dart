import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/network/controller/dark_mode_controller.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

import '../../routes/routes.dart';

class Profile_Screen extends StatelessWidget {
   Profile_Screen({Key? key}) : super(key: key);
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
                  height: 120,
                  child: Image.asset(
                    "assets/images/profile.png",
                  ),
                  clipBehavior: Clip.antiAlias,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(60)),
                ),
                SizedBox(
                  height: AppSizeHeight.s8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Bishoy Shehata",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: FontSize.s18),
                    ),
                    Text(
                      "Elmasry01285@gmail.com",
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
              onTap: (){
               Get.toNamed(Routes.notificationScreen);
              }
              ,child: Row(
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
            Row(
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
                      "Logout",
                      style: TextStyle(
                          fontSize: FontSize.s18,),
                    ),
                  ],
                ),

              ],
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
