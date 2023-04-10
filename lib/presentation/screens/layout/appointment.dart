import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class Appointment_Screen extends StatefulWidget {
  const Appointment_Screen({Key? key}) : super(key: key);

  @override
  State<Appointment_Screen> createState() => _Appointment_ScreenState();
}

class _Appointment_ScreenState extends State<Appointment_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              labelColor: ColorManager.primary,
              unselectedLabelColor: ColorManager.grey,
              indicatorColor: ColorManager.primary,
              tabs: const <Widget>[
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.calendarPlus,
                    //color: ColorManager.primary,
                  ),
                  text: 'Upcoming',
                ),
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.calendarCheck,
                    //color: ColorManager.primary,
                  ),
                  text: 'Completed',
                ),
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.calendarXmark,
                    //color: ColorManager.primary,
                  ),
                  text: 'Cancelled',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Center(child: appointment()),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appointment() => Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      height: AppSizeHeight.s100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //     offset: Offset(0, 3),
        //   )
        // ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.p18),
              color: ColorManager.grey,
            ),
            width: AppSizeWidth.s90,
            height: AppSizeHeight.s100,
          ),
          Expanded(child: Column()),
          CircleAvatar(
            radius: AppSizeHeight.s20,
            backgroundColor: ColorManager.secondary,
            child: Icon(
              Icons.note_add_rounded,
              size: AppSizeHeight.s25,
              color: ColorManager.primary,
            ),
          )
        ],
      ),
    );
