

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/doctor_add_appointment.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/doctor_follow_up.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/doctor_home.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/doctor_setting.dart';
import 'package:hospital/presentation/screens/doctor_screens_side/screens/finished_appoinmetns.dart';
import 'package:hospital/presentation/screens/layout/view/profile.dart';


class DoctorMainController extends GetxController{

  RxInt currentIndex = 0.obs ;

  final tabs = [
    DoctorHomeScreen(),
    DoctorFollowUpScreen(),
    DoctorAddAppointmentScreen(),
    DoctorFinishedAppointmentScreen(),
    ProfileScreen(),
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
      icon: Icon(Icons.calendar_month_outlined
      ),
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


}