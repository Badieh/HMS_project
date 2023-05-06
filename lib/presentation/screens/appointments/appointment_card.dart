import 'package:flutter/material.dart';
import 'package:hospital/models/appointment_model.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;

class AppointmentCard extends StatelessWidget {
  const AppointmentCard(
      {Key? key,
      required this.appointmentState,
      required this.appointmentModel})
      : super(key: key);
  final AppointmentState appointmentState;
  final AppointmentModel appointmentModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.p18),
              color: ColorManager.grey,
            ),
            width: AppSizeWidth.s90,
            height: AppSizeHeight.s90,
            child: flutter_blurhash.BlurHash(
              image: appointmentModel.departmentImageUrl,
              hash: appointmentModel.departmentImageHash!,
              duration: const Duration(milliseconds: 500),
              imageFit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 45,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointmentModel.doctorName,
                        style: TextStyle(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: AppSizeHeight.s4,
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppPadding.p10),
                          // width: AppSizeWidth.s98,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color:
                                    getAppointmentStateColor(appointmentState)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                getAppointmentStateIcon(appointmentState),
                                size: AppSizeHeight.s16,
                                color:
                                    getAppointmentStateColor(appointmentState),
                              ),
                              Text(
                                " ${getAppointmentState(appointmentState)}",
                                style: TextStyle(
                                    fontSize: FontSize.s14,
                                    fontWeight: FontWeight.w600,
                                    color: getAppointmentStateColor(
                                        appointmentState)),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const Spacer(),
                  // CircleAvatar(
                  //   radius: AppSizeHeight.s20,
                  //   backgroundColor: ColorManager.secondary,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     tooltip: AppStrings.notes,
                  //     splashColor: ColorManager.darkGrey,
                  //     splashRadius: AppSizeHeight.s25,
                  //     icon: Icon(Icons.note_add_rounded),
                  //     iconSize: AppSizeHeight.s25,
                  //     color: ColorManager.primary,
                  //   ),
                  // )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: Center(
                      child: Text(
                        appointmentModel.department,
                        style: TextStyle(
                          fontSize: FontSize.s14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                    child: Text(
                      "|",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: AppPadding.p8),
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: Center(
                      child: Text(
                        appointmentModel.hospitalName,
                        style: TextStyle(
                          fontSize: FontSize.s14,
                        ),
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      appointmentModel.date,
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      appointmentModel.startTime,
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

enum AppointmentState { upcoming, completed, cancelled }

String getAppointmentState(AppointmentState appointmentState) {
  switch (appointmentState) {
    case AppointmentState.upcoming:
      return AppStrings.upcoming;
    case AppointmentState.completed:
      return AppStrings.completed;
    case AppointmentState.cancelled:
      return AppStrings.cancelled;
  }
}

Color getAppointmentStateColor(AppointmentState appointmentState) {
  switch (appointmentState) {
    case AppointmentState.upcoming:
      return ColorManager.primary;
    case AppointmentState.completed:
      return ColorManager.green;
    case AppointmentState.cancelled:
      return ColorManager.error;
  }
}

IconData getAppointmentStateIcon(AppointmentState appointmentState) {
  switch (appointmentState) {
    case AppointmentState.upcoming:
      return Icons.next_plan;
    case AppointmentState.completed:
      return Icons.check_circle_rounded;
    case AppointmentState.cancelled:
      return Icons.cancel;
  }
}
