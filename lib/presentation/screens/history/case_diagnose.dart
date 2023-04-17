import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/models/caseDiagnoseModel.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_states.dart';
import 'package:hospital/presentation/screens/pdf_preview.dart';

class CaseDiagnoseScreen extends StatelessWidget {
  final CaseDiagnose caseDiagnose;
  const CaseDiagnoseScreen({Key? key, required this.caseDiagnose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);

    return BlocConsumer<HistoryCubit, HistoryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HistoryCubit cubit = HistoryCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppStrings.caseDiagnose,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hospital Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.hospitalName_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          caseDiagnose.hospitalName,
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

                  // patient
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.patient_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          caseDiagnose.patientName,
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

                  // Doctor
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
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          caseDiagnose.doctorName,
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

                  // Date
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.date_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          '${dateTime.year}/${dateTime.month}/${dateTime.day}',
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

                  // Time
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.time_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          '${dateTime.hour}:${dateTime.month}:${dateTime.second}',
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

                  // Department Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.departmentName_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          caseDiagnose.departmentName,
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

                  // location
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.location_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          caseDiagnose.location,
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

                  // Clinical Examination
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.clinicalExamination_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        //maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          Flexible(
                            child: AutoSizeText(
                              caseDiagnose.clinicalExamination,
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

                  // Diagnosis
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        AppStrings.diagnosis_,
                        style: TextStyle(
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          caseDiagnose.diagnosis,
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

                  // Notes
                  if (caseDiagnose.notes != null)
                    Column(
                      children: [
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
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                            ),
                            Flexible(
                              child: AutoSizeText(
                                caseDiagnose.notes!,
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
                ]),
          ),
          floatingActionButton: FloatingActionButton(
            isExtended: false,
            elevation: 2.0,
            hoverElevation: 6.0,
            focusElevation: 6.0,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPreviewScreen(
                      caseDiagnose: caseDiagnose,
                      title: AppStrings.caseDiagnoseReport,
                    ),
                  ));
            },
            child: const FaIcon(FontAwesomeIcons.filePdf),
            // mini: false,
          ),
        );
      },
    );
  }
}
