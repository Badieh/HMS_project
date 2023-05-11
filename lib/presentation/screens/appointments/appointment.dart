import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/appointments/appointment_card.dart';
import 'package:hospital/presentation/screens/appointments/cancel_appointment.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_cubit.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_states.dart';
import 'package:hospital/presentation/screens/book_appointments/book_appointments.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentsCubit, AppointmentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppointmentsCubit cubit = AppointmentsCubit().get(context);
        return DefaultTabController(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p4),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: cubit.cancelledAppointments.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                AppointmentCard(
                                  appointmentState: AppointmentState.upcoming,
                                  appointmentModel:
                                      cubit.upcomingAppointments[index],
                                ),
                                separator(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppPadding.p8,
                                      bottom: AppPadding.p2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          await cancelAppointment(
                                              cubit: cubit, index: index);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: Size(AppSizeWidth.s150,
                                                AppSizeHeight.s30),
                                            backgroundColor: ColorManager.white,
                                            foregroundColor:
                                                ColorManager.primary,
                                            side: BorderSide(
                                                color: ColorManager.primary,
                                                width: 2)),
                                        child: const Text(
                                          AppStrings.cancel,
                                          style: TextStyle(),
                                        ),
                                      ),
                                      //SizedBox(width: MediaQuery.of(context).size.width/45,),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await cubit.getClinicsSchedule(
                                              docId: cubit
                                                  .upcomingAppointments[index]
                                                  .doctorName);

                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return BookAppointmentScreen(
                                                  title: AppStrings
                                                      .rescheduleAppointment,
                                                  clinicsScheduleList: cubit
                                                      .clinicsScheduleList);
                                            },
                                          ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(
                                            AppSizeWidth.s150,
                                            AppSizeHeight.s30,
                                          ),
                                        ),
                                        child: const Text(
                                          AppStrings.reschedule,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p4),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: cubit.completedAppointments.length,
                        itemBuilder: (context, index) => AppointmentCard(
                            appointmentModel:
                                cubit.completedAppointments[index],
                            appointmentState: AppointmentState.completed)),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p4),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        itemCount: cubit.cancelledAppointments.length,
                        itemBuilder: (context, index) => AppointmentCard(
                            appointmentModel:
                                cubit.cancelledAppointments[index],
                            appointmentState: AppointmentState.cancelled)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future cancelAppointment(
          {required AppointmentsCubit cubit, required int index}) =>
      showModalBottomSheet(
        backgroundColor: ColorManager.white,
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode ? ColorManager.lightBlack:ColorManager.white ,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizeHeight.s20))
              ),
            height: MediaQuery.of(context).size.height / 3,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    AppStrings.cancelAppointment,
                    style: TextStyle(
                        fontSize: FontSize.s25,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.error),
                  ),
                  separator(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Text(
                      AppStrings.areSure,
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        //fontWeight: FontWeight.w900,
                        //color: ColorManager.error
                      ),
                    ),
                  ),
                  separator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(AppSizeWidth.s150, AppSizeHeight.s30),
                            backgroundColor: ColorManager.white,
                            foregroundColor: ColorManager.primary,
                            side: BorderSide(
                                color: ColorManager.primary, width: 2)),
                        child: const Text(
                          AppStrings.back,
                        ),
                      ),
                      //SizedBox(width: MediaQuery.of(context).size.width/45,),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CancelAppointmentScreen(
                                    appointmentId:
                                        cubit.upcomingAppointments[index].id),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            AppSizeWidth.s150,
                            AppSizeHeight.s30,
                          ),
                        ),
                        child: Text(
                          AppStrings.yesCancel,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
