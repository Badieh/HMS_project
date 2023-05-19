import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/network/remote/all_patient_service.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/doctor_add_appointment.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/follow_up/tabs/doctor_follow_up.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/follow_up/doctor_home/doctor_home.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/doctor_setting.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/finished_appoinmetns.dart';
import 'package:hospital/presentation/screens/layout/view/profile.dart';

import '../../presentation/screens/routes/routes.dart';

class DoctorMainController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<PatientModel> allPatientDataList =
      [patientModel1, patientModel2, patientModel1, patientModel1].obs;
  var isLoading = true.obs;

  final tabs = [
    DoctorHomeScreen(),
    DoctorFollowUpScreen(),
    DoctorAddAppointmentScreen(),
    DoctorFinishedAppointmentScreen(),
    ProfileScreen(),
    // DoctorSettingScreen()
  ].obs;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      label: 'Home',
      activeIcon: Icon(
        Icons.home,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.note_alt_outlined,
      ),
      label: 'Follow Up',
      activeIcon: Icon(
        Icons.note_alt_sharp,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined),
      label: 'Appointments',
      activeIcon: Icon(
        Icons.calendar_month,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.library_add_check_outlined,
      ),
      label: 'Done',
      activeIcon: Icon(
        Icons.library_add_check_rounded,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
      ),
      label: 'Profile',
      activeIcon: Icon(
        Icons.person,
      ),
    ),
  ].obs;

  // ========================  get all allPatients  ==============================

//   void getAllPatients() async {
//     PatientModel allPatients = await AllPatientServices.allPatientDetails();
//     if (allPatients.status == 1) {
//       if (allPatientDataList.length == 0) {
//         if (allPatients.data == null) {
//           allPatientDataList = [].obs;
//         }
//         allPatientDataList.addAll(allPatients.data);
//       }
//       if (allPatientDataList.length != allPatients.data.length) {
//         List allPatientDataList = [].obs;
//         allPatientDataList.addAll(allPatients.data);
//       }
//       print("===================");
//       print(allPatientDataList);
//       print("===================");
//
//       isLoading.value = false;
//     } else {
//       Get.snackbar(
//         "Error",
//         allPatients.message,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         icon: const Icon(Icons.error, color: Colors.white),
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

  List clinicsScheduleList = [
    clinicsScheduleModel_1,
    clinicsScheduleModel_4,
    clinicsScheduleModel_1,
    clinicsScheduleModel_2,
    // clinicsScheduleModel_4,
    // clinicsScheduleModel_3,
    // clinicsScheduleModel_1,
  ];

  final List appBars = [
    AppBar(
      toolbarHeight: AppSizeHeight.s70,
      title: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeHeight.s50),
              color:
                  Get.isDarkMode ? ColorManager.lightBlack : ColorManager.white,
            ),
            width: AppSizeWidth.s55,
            height: AppSizeHeight.s55,
            child: flutter_blurhash.BlurHash(
              image: AppConstants.adminStorage.read('patientPP'),
              hash: imageHashdummy,
              duration: const Duration(milliseconds: 500),
              imageFit: BoxFit.cover,
            ),
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
                  AppConstants.adminStorage.read('userId').toString(),
                  style: TextStyle(
                    fontSize: FontSize.s16,
                  ),
                ),
              ],
            ),
          ),
        ],
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
      ],
    ),
    AppBar(
      leading: Icon(Icons.pending_actions_outlined,size: AppSizeHeight.s25,color: Get.isDarkMode ? Colors.white :ColorManager.primary,),
      toolbarHeight: AppSizeHeight.s70,
      title: Text("Follow Up", style: TextStyle(fontSize: FontSize.s25,fontWeight: FontWeight.bold),)

    ),
    null,
    AppBar(
      title: const Text('Articles'),
    ),
    AppBar(
      toolbarHeight: AppSizeHeight.s70,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: AppSizeHeight.s40,
            width: AppSizeWidth.s40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Image.asset(
              ImageAssets.hands1,
            ),
          ),
          SizedBox(
            width: AppSizeWidth.s18,
          ),
          Text(
            AppStrings.profile,
            style: TextStyle(fontSize: FontSize.s20),
          ),
        ],
      ),
    ),
  ].obs;
  List<List<String>> convertToNestedList() {
    // Sort by day of the week then start time
    clinicsScheduleList.sort((a, b) {
      final dayComparison = a.day.compareTo(b.day);
      if (dayComparison != 0) {
        return dayComparison;
      } else {
        return a.startTime.compareTo(b.startTime);
      }
    });

    // Add the headers as the first sublist
    final nestedList = <List<String>>[
      [
        'Day',
        'From',
        'To',
      ],
      ...clinicsScheduleList.map((schedule) => [
            AppConstants.weekDayNames[schedule.day],
            schedule.startTime,
            schedule.endTime,
          ])
    ];
    return nestedList;
  }
}
