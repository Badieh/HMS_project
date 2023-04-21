import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/appointments/appointment_card.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_cubit.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_states.dart';

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
                        itemBuilder: (context, index) => AppointmentCard(
                              appointmentState: AppointmentState.upcoming,
                              appointmentModel:
                                  cubit.upcomingAppointments[index],
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
}
