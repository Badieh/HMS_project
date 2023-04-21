import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/treatment_model.dart';
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
      //height: AppSizeHeight.s150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
        image: DecorationImage(
          image: NetworkImage(treatment.departmentIconUrl),
          opacity: 0.07,
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 45,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Treatment Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      AppStrings.treatment,
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
                    Text(
                      treatment.treatmentName,
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        //fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                // Doctor Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      AppStrings.doctorName_,
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
                    Text(
                      'Dr.${treatment.doctor}',
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        //fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                // Start Date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      AppStrings.startDate_,
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
                    Text(
                      treatment.startDate,
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        //fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                // End Date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      AppStrings.endDate_,
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
                    Text(
                      treatment.endDate,
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        //fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                // Dose
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      AppStrings.dose_,
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
                    Text(
                      treatment.dose,
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        //fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                // Instructuins
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      AppStrings.instructions_,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    Flexible(
                      child: AutoSizeText(
                        treatment.instructions,
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
          ),
        ],
      ),
    );
  }
}
