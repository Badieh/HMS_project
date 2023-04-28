import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_states.dart';
import 'package:hospital/presentation/screens/history/files/pdf_printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CaseDiagnoseReportScreen extends StatelessWidget {
  final CaseDiagnose caseDiagnose;
  const CaseDiagnoseReportScreen({Key? key, required this.caseDiagnose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);

    return BlocConsumer<HistoryCubit, HistoryStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //HistoryCubit cubit = HistoryCubit().get(context);
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
                    builder: (context) => PdfPrintingScreen(
                      caseDiagnose: caseDiagnose,
                      title: AppStrings.caseDiagnoseReport,
                    ),
                  ));
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => PdfPreviewScreen(
              //         url: '',
              //       ),
              //     ));
            },
            child: const FaIcon(FontAwesomeIcons.filePdf),
            // mini: false,
          ),
        );
      },
    );
  }
}

Future<void> caseDiagnoseReport(
    {required pdf, required CaseDiagnose caseDiagnose}) async {
  final fontRegular = await PdfGoogleFonts.alefRegular();
  final fontBold = await PdfGoogleFonts.alegreyaBold();
  DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);
  final date = '${dateTime.year}/${dateTime.month}/${dateTime.day}';
  final time = '${dateTime.hour}:${dateTime.month}:${dateTime.second}';

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Title
            pw.Center(
              child: pw.Text(
                AppStrings.caseDiagnose,
                style: pw.TextStyle(
                  font: fontBold,
                  fontSize: FontSize.s25,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),

            // Hospital Name
            reportRow(fontBold, fontRegular, AppStrings.hospitalName_,
                caseDiagnose.hospitalName),

            // patient
            reportRow(fontBold, fontRegular, AppStrings.patient_,
                caseDiagnose.patientName),

            // Doctor
            reportRow(fontBold, fontRegular, AppStrings.doctorName_,
                caseDiagnose.doctorName),

            // Date
            reportRow(fontBold, fontRegular, AppStrings.date_, date),

            // Time
            reportRow(fontBold, fontRegular, AppStrings.time_, time),

            // Department Name
            reportRow(fontBold, fontRegular, AppStrings.departmentName_,
                caseDiagnose.departmentName),

            // location
            reportRow(fontBold, fontRegular, AppStrings.location_,
                caseDiagnose.location),

            // Clinical Examination
            reportRow(fontBold, fontRegular, AppStrings.clinicalExamination_,
                caseDiagnose.clinicalExamination),
            // Diagnosis
            reportRow(fontBold, fontRegular, AppStrings.diagnosis_,
                caseDiagnose.diagnosis),

            // Notes
            if (caseDiagnose.notes != null)
              reportRow(
                  fontBold, fontRegular, AppStrings.notes_, caseDiagnose.notes),
          ]),
    ),
  );
}

pw.Row reportRow(pw.Font fontBold, pw.Font fontRegular, title, text) {
  return pw.Row(
    //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        title,
        style: pw.TextStyle(
          font: fontBold,
          fontSize: FontSize.s20,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.SizedBox(width: AppPadding.p14),
      pw.Flexible(
        child: pw.Text(
          text,
          style: pw.TextStyle(
            font: fontRegular,
            fontSize: FontSize.s20,
            fontWeight: pw.FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}
