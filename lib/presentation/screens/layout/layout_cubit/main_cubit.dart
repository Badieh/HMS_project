import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/articles/articles.dart';
import 'package:hospital/presentation/screens/history/history.dart';
import 'package:hospital/presentation/screens/appointments/appointment.dart';
import 'package:hospital/presentation/screens/layout/view/home.dart';
import 'package:hospital/presentation/screens/layout/view/notification.dart';
import 'package:hospital/presentation/screens/layout/view/profile.dart';

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
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));

          },
          icon: Icon(
            Icons.notifications_active_outlined,
            size: AppSizeHeight.s28,
          ),
        ),
        IconButton(
          onPressed: () {},
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            size: AppSizeHeight.s28,
          ),
        ),
      ],
    ),
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
