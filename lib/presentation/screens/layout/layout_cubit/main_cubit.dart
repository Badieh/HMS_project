import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/articles/articles.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/history/history.dart';
import 'package:hospital/presentation/screens/appointments/appointment.dart';
import 'package:hospital/presentation/screens/layout/view/home.dart';
import 'package:hospital/presentation/screens/layout/view/profile.dart';

import '../../routes/routes.dart';
import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit(BuildContext context) : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final tabs = [
    HomeScreen(),
    AppointmentScreen(),
    HistoryScreen(),
    ArticlesScreen(),
    ProfileScreen(),
  ];
  final titles = [];


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
        Icons.calendar_month_outlined,
      ),
      label: 'Appointment',
      activeIcon: Icon(
        Icons.calendar_month,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.history_outlined,
      ),
      label: 'History',
      activeIcon: Icon(
        Icons.history,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.article_outlined,
      ),
      label: 'Article',
      activeIcon: Icon(
        Icons.article_rounded,
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
  ];

  void ChangeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeMainScreenIndex());
  }
}
