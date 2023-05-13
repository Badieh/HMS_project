import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_cubit.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_states.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';

class BookAppointmentScreen extends StatelessWidget {
  BookAppointmentScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  final TextEditingController problemController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookAppointmentCubit, BookAppointmentStates>(
        listener: (context, state) {
      //BookAppointmentCubit cubit = BookAppointmentCubit().get(context);
    }, builder: (context, state) {
      BookAppointmentCubit cubit = BookAppointmentCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.writeProblem,
                    style: TextStyle(
                        fontSize: FontSize.s22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: problemController,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: AppStrings.howHelp,
                          fillColor: ColorManager.lightPrimary),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onTapOutside: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      maxLines: 5,
                      minLines: 1),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    AppStrings.selectDate,
                    style: TextStyle(
                        fontSize: FontSize.s22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizeHeight.s16),
                      color: ColorManager.lightPrimary,
                    ),
                    child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2024),
                      // to be used to turn off days
                      selectableDayPredicate: (day) {
                        // if (day.weekday == 1) return false;

                        return true;
                      },
                      onDateChanged: (DateTime value) {
                        cubit.getTimesOfDay(date: value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    AppStrings.selectTime,
                    style: TextStyle(
                        fontSize: FontSize.s22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  ConditionalBuilder(
                      condition: cubit.modifiedClinicsScheduleList.isNotEmpty,
                      builder: (context) => Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSizeHeight.s16),
                              color: ColorManager.lightPrimary,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              clipBehavior: Clip.antiAlias,
                              itemCount:
                                  cubit.modifiedClinicsScheduleList.length,
                              itemBuilder: (context, index) => RadioListTile(
                                //dense: true,
                                //tileColor: ColorManager.lightPrimary,
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                title: Text(
                                  '${cubit.modifiedClinicsScheduleList[index].startTime} - ${cubit.modifiedClinicsScheduleList[index].endTime}',
                                  style: TextStyle(
                                      fontSize: FontSize.s18,
                                      fontWeight: FontWeight.w500),
                                ),
                                value: index,
                                groupValue: cubit.selectedTimeIndex == -1
                                    ? null
                                    : cubit.selectedTimeIndex,
                                onChanged: (int? value) {
                                  cubit.changeSelectedTime(
                                      newIndex: value!,
                                      startTime: cubit
                                          .modifiedClinicsScheduleList[index]
                                          .startTime,
                                      endTime: cubit
                                          .modifiedClinicsScheduleList[index]
                                          .endTime,
                                      day: cubit
                                          .modifiedClinicsScheduleList[index]
                                          .day);
                                },
                                activeColor: ColorManager.primary,
                              ),
                            ),
                          ),
                      fallback: (context) => Center(
                              child: Lottie.asset(
                            ImageAssets.notAvailable,
                          ))),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: AppSizeHeight.s16,
          surfaceTintColor: Colors.transparent,
          height: AppSizeHeight.s65,
          color: ColorManager.white,
          child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                if (cubit.selectedStartTime.isNotEmpty &&
                    cubit.selectedEndTime.isNotEmpty) {
                  await cubit.bookAppointment();

                  cubit.selectedTimeIndex = -1;
                  Get.offAllNamed(Routes.homeLayoutScreen);
                  QuickAlert.show(
                    context: context,
                    backgroundColor: ColorManager.lightPrimary,
                    barrierDismissible: false,
                    type: QuickAlertType.success,
                    width: MediaQuery.of(context).size.width,
                    title: title == AppStrings.bookAppointment
                        ? AppStrings.appointmentCreated
                        : AppStrings.appointmentRescheduled,
                    text:
                        'On ${cubit.date.day} of ${AppConstants.monthNames[cubit.date.month]} \nFrom ${cubit.selectedStartTime} To ${cubit.selectedEndTime}',
                    animType: QuickAlertAnimType.slideInDown,
                  );
                  cubit.selectedStartTime = '';
                  cubit.selectedEndTime = '';
                  cubit.selectedDay = 0;
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeLayoutScreen(),
                  //     ));
                } else {
                  QuickAlert.show(
                    backgroundColor: ColorManager.lightPrimary,
                    context: context,
                    barrierDismissible: false,
                    type: QuickAlertType.warning,
                    width: MediaQuery.of(context).size.width,
                    title: AppStrings.plsSelectTime,
                    animType: QuickAlertAnimType.slideInDown,
                  );
                }
              }
            },
            child: Text(
              AppStrings.bookAppointment,
              style: TextStyle(
                  fontSize: FontSize.s16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    });
  }
}
