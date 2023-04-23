import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_cubit.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_states.dart';
import 'package:hospital/presentation/screens/book_appointments/time_card.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment(
      {Key? key, required this.title, required this.clinicsScheduleList})
      : super(key: key);
  final String title;
  final List<ClinicsScheduleModel> clinicsScheduleList;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookAppointmentCubit()
        ..getclinicsScheduleList(clinicsScheduleList: clinicsScheduleList),
      child: BlocConsumer<BookAppointmentCubit, BookAppointmentStates>(
          listener: (context, state) {
        BookAppointmentCubit cubit = BookAppointmentCubit().get(context);
      }, builder: (context, state) {
        BookAppointmentCubit cubit = BookAppointmentCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select a Date',
                  style: TextStyle(
                      fontSize: FontSize.s20, fontWeight: FontWeight.w600),
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
                      cubit.getTimesOfDay(value.weekday);
                    },
                  ),
                ),
                Text(
                  'Select a Time',
                  style: TextStyle(
                      fontSize: FontSize.s20, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: cubit.modifiedClinicsScheduleList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: RadioListTile(
                        value:
                            " ${cubit.modifiedClinicsScheduleList[index].startTime} -${cubit.modifiedClinicsScheduleList[index].endTime}",
                        groupValue: cubit.selectedTime,
                        onChanged: (value) {
                          cubit.changeSelectedTime(value!);
                        },
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
