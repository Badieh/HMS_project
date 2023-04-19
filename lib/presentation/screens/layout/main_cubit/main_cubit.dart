import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      label: 'Home',
      activeIcon: Icon(
        Icons.home,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.calendar_month,
        color: Colors.black,
      ),
      label: 'Appointment',
      activeIcon: Icon(
        Icons.calendar_month,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.newspaper,
        color: Colors.black,
      ),
      label: 'History',
      activeIcon: Icon(
        Icons.newspaper,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.archive_outlined,
        color: Colors.black,
      ),
      label: 'Archive',
      activeIcon: Icon(
        Icons.archive_outlined,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: Colors.black,
      ),
      label: 'Profile',
      activeIcon: Icon(
        Icons.person,
        color: Colors.blue,
      ),
    ),
  ];

  void ChangeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeMainScreenIndex());
  }
}
