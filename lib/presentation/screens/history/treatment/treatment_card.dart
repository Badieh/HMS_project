import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/models/treatment_model.dart';
import 'package:hospital/presentation/components/text_utils.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class TreatmentCard extends StatelessWidget {
  const TreatmentCard({Key? key, required this.treatment}) : super(key: key);
  final Treatment treatment;
  @override
  Widget build(BuildContext context) {
    //DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);
    return Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
        image: DecorationImage(
          image: NetworkImage(treatment.departmentIconUrl),
          opacity: 0.07,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Treatment Name

          // patient
          Text_Utils(
              isUndeLine: false,
              fontWeight: FontWeight.bold,
              text: AppStrings.treatment_,
              color: ColorManager.black,
              fontsize: FontSize.s22),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.kitMedical,
                size: AppSizeHeight.s16,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: AppSizeWidth.s285,
                child: Text_Utils(
                    maxlines: 10,
                    isUndeLine: false,
                    fontWeight: FontWeight.bold,
                    text: treatment.treatmentName,
                    color: Colors.grey.shade700,
                    fontsize: FontSize.s15),
              ),
            ],
          ),
          // Doctor Name

          SizedBox(
            height: AppSizeHeight.s4,
          ),
          Text_Utils(
              isUndeLine: false,
              fontWeight: FontWeight.bold,
              text: AppStrings.doctorName_,
              color: ColorManager.black,
              fontsize: FontSize.s22),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.userNurse,
                size: AppSizeHeight.s16,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: AppSizeWidth.s285,
                child: Text_Utils(
                    maxlines: 10,
                    isUndeLine: false,
                    fontWeight: FontWeight.bold,
                    text: 'Dr.${treatment.doctor}',
                    color: Colors.grey.shade700,
                    fontsize: FontSize.s15),
              ),
            ],
          ),

          // Start Date

          SizedBox(
            height: AppSizeHeight.s4,
          ),
          Text_Utils(
              isUndeLine: false,
              fontWeight: FontWeight.bold,
              text: AppStrings.startDate_,
              color: ColorManager.black,
              fontsize: FontSize.s22),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.calendar,
                size: AppSizeHeight.s16,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: AppSizeWidth.s285,
                child: Text_Utils(
                    maxlines: 10,
                    isUndeLine: false,
                    fontWeight: FontWeight.bold,
                    text: treatment.startDate,
                    color: Colors.grey.shade700,
                    fontsize: FontSize.s15),
              ),
            ],
          ),

          // End Date
          SizedBox(
            height: AppSizeHeight.s4,
          ),
          Text_Utils(
              isUndeLine: false,
              fontWeight: FontWeight.bold,
              text: AppStrings.endDate_,
              color: ColorManager.black,
              fontsize: FontSize.s22),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.calendarCheck,
                size: AppSizeHeight.s16,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: AppSizeWidth.s285,
                child: Text_Utils(
                    maxlines: 10,
                    isUndeLine: false,
                    fontWeight: FontWeight.bold,
                    text: treatment.endDate,
                    color: Colors.grey.shade700,
                    fontsize: FontSize.s15),
              ),
            ],
          ),
          // Dose

          SizedBox(
            height: AppSizeHeight.s4,
          ),
          Text_Utils(
              isUndeLine: false,
              fontWeight: FontWeight.bold,
              text: AppStrings.dose_,
              color: ColorManager.black,
              fontsize: FontSize.s22),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.listOl,
                size: AppSizeHeight.s16,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: AppSizeWidth.s285,
                child: Text_Utils(
                    maxlines: 10,
                    isUndeLine: false,
                    fontWeight: FontWeight.bold,
                    text: treatment.dose,
                    color: Colors.grey.shade700,
                    fontsize: FontSize.s15),
              ),
            ],
          ),



          // Instructuins
          SizedBox(
            height: AppSizeHeight.s4,
          ),
          Text_Utils(
              isUndeLine: false,
              fontWeight: FontWeight.bold,
              text: AppStrings.instructions_,
              color: ColorManager.black,
              fontsize: FontSize.s22),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.solidFileLines,
                size: AppSizeHeight.s16,
                color: ColorManager.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: AppSizeWidth.s285,
                child: Text_Utils(
                    maxlines: 10,
                    isUndeLine: false,
                    fontWeight: FontWeight.bold,
                    text: treatment.instructions,
                    color: Colors.grey.shade700,
                    fontsize: FontSize.s15),
              ),
            ],
          ),



          if (treatment.notes != null)

            Row(
              children: [
                Text(
                  AppStrings.notes_,
                  style: TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 45,
                ),
              ],
            ),
          if (treatment.notes != null)
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                Flexible(
                  child: AutoSizeText(
                    treatment.notes!,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      //fontWeight: FontWeight.bold,
                    ),
                    minFontSize: FontSize.s14,
                    stepGranularity: FontSize.s14,
                    maxLines: 4,
                    //textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
