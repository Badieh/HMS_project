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
    Profile_Screen(),
  ];
  final titles = [];
  final List appBars = [
    AppBar(
      toolbarHeight: AppSizeHeight.s70,
      title: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: AppSizeHeight.s55,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(ImageAssets.profile),
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
                  AppStrings.docName,
                  style: TextStyle(fontSize: FontSize.s16),
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
        IconButton(
          onPressed: () {

            //Get.toNamed(Routes.favouriteScreen);
          },
          icon: Icon(
            Icons.favorite_border,
            size: AppSizeHeight.s28,
          ),
        ),
      ],
    ),
    null,
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
  ];

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
