import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_cubit.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_states.dart';
import 'package:quickalert/quickalert.dart';

class CancelAppointmentScreen extends StatelessWidget {
  CancelAppointmentScreen({Key? key, required this.appointmentId})
      : super(key: key);
  final int appointmentId;
  final TextEditingController problemController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentsCubit, AppointmentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppointmentsCubit cubit = AppointmentsCubit().get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.cancelAppointment),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason1,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason1,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason2,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason2,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason3,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason3,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason4,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason4,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason5,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason5,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason6,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason6,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason7,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason7,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                RadioListTile<String>(
                  //dense: true,
                  //tileColor: ColorManager.lightPrimary,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  title: Text(
                    AppStrings.reason8,
                    style: TextStyle(
                        fontSize: FontSize.s16, fontWeight: FontWeight.w500),
                  ),

                  value: AppStrings.reason8,
                  groupValue: cubit.selectedReason,
                  onChanged: (String? value) {
                    cubit.changeSelectedReason(index: value!);
                  },
                  activeColor: ColorManager.primary,
                ),
                if (cubit.selectedReason == AppStrings.reason8)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16, vertical: AppPadding.p8),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: problemController,
                        decoration: InputDecoration(
                            fillColor: Get.isDarkMode ? ColorManager.lightBlack :ColorManager.lightPrimary,
                            hintText: 'Let us know if there is a problem..'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.validator;
                          }
                        },
                        onTapOutside: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        maxLines: 5,
                        minLines: 2),
                  ),
              ]),
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
                  await cubit
                      .cancelAppointment(appointmentId: appointmentId)
                      .then((value) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    return QuickAlert.show(
                      confirmBtnColor: ColorManager.green,
                      context: context,
                      backgroundColor:Get.isDarkMode? ColorManager.darkGrey: ColorManager.lightPrimary,
                      barrierDismissible: false,
                      type: QuickAlertType.success,
                      width: MediaQuery.of(context).size.width,
                      title: '',
                      widget: Center(
                        child: Text(
                          AppStrings.appointmentCancelled,
                          style: TextStyle(
                              fontSize: FontSize.s23,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      animType: QuickAlertAnimType.slideInDown,
                    );
                  });
                }
              },
              child: Text(
                AppStrings.submit,
                style: TextStyle(
                    fontSize: FontSize.s16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
