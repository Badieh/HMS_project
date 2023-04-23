import 'package:flutter/material.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class TimeCard extends StatelessWidget {
  const TimeCard(
      {Key? key, required this.clinicsSchedule})
      : super(key: key);
  final ClinicsScheduleModel clinicsSchedule;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizeHeight.s16),
        color: ColorManager.lightPrimary,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          clinicsSchedule.startTime,
          style:
              TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.w600),
        ),
        Text(
          '-',
          style:
              TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.w600),
        ),
        Text(
          clinicsSchedule.endTime,
          style:
              TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}
