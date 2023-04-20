import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/articles/articles.dart';
import 'package:hospital/presentation/screens/history/history.dart';
import 'package:hospital/presentation/screens/layout/view/appointment.dart';
import 'package:hospital/presentation/screens/layout/view/home.dart';
import 'package:hospital/presentation/screens/layout/view/profile.dart';

import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final tabs = [
    Home_Screen(),
    AppointmentScreen(),
    HistoryScreen(),
    ArticlesScreen(),
    Profile_Screen(),
  ];
  final titles = [

  ];

  List<BottomNavigationBarItem> items = [
     BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: ColorManager.black,
      ),
      label: 'Home',
      activeIcon: Icon(
        Icons.home,
        color: ColorManager.primary,
      ),
    ),
     BottomNavigationBarItem(
      icon: Icon(
        Icons.calendar_month_outlined,
        color: ColorManager.black,
      ),
      label: 'Appointment',
      activeIcon: Icon(
        Icons.calendar_month,
        color: ColorManager.primary,
      ),
    ),
     BottomNavigationBarItem(
      icon: Icon(
        Icons.history_outlined,
        color: ColorManager.black,
      ),
      label: 'History',
      activeIcon: Icon(
        Icons.history,
        color: ColorManager.primary,
      ),
    ),
     BottomNavigationBarItem(
      icon: Icon(
        Icons.article_outlined,
        color: ColorManager.black,
      ),
      label: 'Article',
      activeIcon: Icon(
        Icons.article_rounded,
        color: ColorManager.primary,
      ),
    ),
     BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        color: ColorManager.black,
      ),
      label: 'Profile',
      activeIcon: Icon(
        Icons.person,
        color: ColorManager.primary,
      ),
    ),
  ];

  void ChangeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeMainScreenIndex());
  }
}
