import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/network/controller/dark_mode_controller.dart';
import 'package:hospital/network/controller/doctor_main_controller.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctors/doctors.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';

class DoctorLayoutScreen extends StatelessWidget {
  DoctorLayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

      var controller = Get.find<DoctorMainController>();

        return SafeArea(
          child: Obx((){
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: AppSizeHeight.s70,
                title: InkWell(
                  onTap: (){

                  },
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: AppSizeHeight.s55,
                        width: AppSizeHeight.s55,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? ColorManager.lightBlack:ColorManager.lightGrey ,

                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.network("https://as2.ftcdn.net/v2/jpg/03/20/52/31/1000_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg"),
                      ),
                      SizedBox(
                        width: AppSizeWidth.s18,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              AppStrings.welcomeMessage,
                              style: TextStyle(fontSize: FontSize.s20),
                            ),
                            AutoSizeText(
                              "Dr "+AppStrings.docName,
                              style: TextStyle(fontSize: FontSize.s16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.notificationScreen);
                    },
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      size: AppSizeHeight.s28,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () async {
                  //     final doctorsCubit = context.read<DoctorsCubit>();
                  //     await doctorsCubit.getDoctors();
                  //     Get.toNamed(Routes.favouriteScreen);
                  //   },
                  //   icon: Icon(
                  //     Icons.favorite_border,
                  //     size: AppSizeHeight.s28,
                  //   ),
                  // ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                items: controller.items,
                selectedLabelStyle: TextStyle(fontSize: FontSize.s10),
                unselectedLabelStyle: TextStyle(fontSize: FontSize.s10),
                showUnselectedLabels: true,
                currentIndex:controller.currentIndex.value,
                onTap: (index){
                controller.currentIndex.value = index;
            },
              ),
              body:  IndexedStack(
                index: controller.currentIndex.value,
                children: controller.tabs,
              )
            );
          })
        );

  }
}
