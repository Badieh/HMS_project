import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';

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
              physics: const BouncingScrollPhysics(),
              tabs: const <Widget>[
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.calendarPlus,
                    //color: ColorManager.primary,
                  ),
                  text: AppStrings.upcoming,
                ),
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.calendarCheck,
                    //color: ColorManager.primary,
                  ),
                  text: AppStrings.completed,
                ),
                Tab(
                  icon: FaIcon(
                    FontAwesomeIcons.calendarXmark,
                    //color: ColorManager.primary,
                  ),
                  text: AppStrings.cancelled,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: 4,
                      itemBuilder: (context, index) => appointmentDoctorCard(
                          context: context,
                          appointmentState: AppointmentState.upcoming)),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: 10,
                      itemBuilder: (context, index) => appointmentDoctorCard(
                          context: context,
                          appointmentState: AppointmentState.completed)),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: 3,
                      itemBuilder: (context, index) => appointmentDoctorCard(
                          context: context,
                          appointmentState: AppointmentState.cancelled)),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
