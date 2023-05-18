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
              appBar: controller.appBars[controller.currentIndex.value],
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
