import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

Widget DefaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  required FormFieldValidator<String>? validator,
  required ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  bool isPassword = false,
  TextInputAction? TextInputAction,
  bool readOnly = false,
  bool enabled = true,
}) =>
    TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                size: 25,
              ),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              ),
      ),
      obscureText: isPassword,
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: onTap,
      readOnly: readOnly,
      enabled: enabled,
    );

Widget favouriteDoctorCard(
        {required BuildContext context,
        IconData icon = Icons.favorite_border}) =>
    Container(
      padding: EdgeInsets.only(left: AppSizeHeight.s8, right: AppSizeHeight.s8),
      width: double.infinity,
      height: AppSizeHeight.s120,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: AppSizeHeight.s100,
            width: AppSizeWidth.s100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
            child: Image.asset(
              "assets/images/doc1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: AppSizeWidth.s4,
          ),
          Column(
            children: [
              SizedBox(
                height: AppSizeHeight.s18,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dr.Badieh ElMasry",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(
                      icon,
                      color: ColorManager.primary,
                    )
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Divider(
                    color: ColorManager.grey2,
                  )),
              SizedBox(
                height: AppSizeHeight.s8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specialist",
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
                      "Hospital Name",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizeHeight.s12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate_outlined,
                      size: AppSizeHeight.s17,
                    ),
                    Text(
                      " 4.8",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      " (4.258 reviews)",
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
          )
        ],
      ),
    );

Widget appointmentDoctorCard(
        {required BuildContext context,
        IconData icon = Icons.favorite_border,
        required AppointmentState appointmentState}) =>
    Container(
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
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.p18),
              color: ColorManager.grey,
            ),
            width: AppSizeWidth.s90,
            height: AppSizeHeight.s100,
            child: Image.asset(
              "assets/images/doc1.jpg",
              fit: BoxFit.cover,
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr.Badieh ElMasry",
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
                            width: AppSizeWidth.s98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: getAppointmentStateColor(
                                      appointmentState)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  getAppointmentStateIcon(appointmentState),
                                  size: AppSizeHeight.s16,
                                  color: getAppointmentStateColor(
                                      appointmentState),
                                ),
                                Text(
                                  getAppointmentState(appointmentState),
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
                  ),
                  CircleAvatar(
                    radius: AppSizeHeight.s20,
                    backgroundColor: ColorManager.secondary,
                    child: IconButton(
                      onPressed: () {},
                      tooltip: AppStrings.notes,
                      splashColor: ColorManager.darkGrey,
                      splashRadius: AppSizeHeight.s25,
                      icon: Icon(Icons.note_add_rounded),
                      iconSize: AppSizeHeight.s25,
                      color: ColorManager.primary,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Specialist",
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
                      "Hospital Name",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate_outlined,
                      size: AppSizeHeight.s17,
                    ),
                    Text(
                      " 4.8",
                      style: TextStyle(
                        fontSize: FontSize.s14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      " (4.258 reviews)",
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
