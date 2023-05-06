import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/presentation/components/text_utils.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
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
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hospital Name

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.hospitalName_,
                        color: ColorManager.black,
                        fontsize: FontSize.s20),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidHospital,
                          size: AppSizeHeight.s16,
                          color: ColorManager.primary,
                        ),
                        SizedBox(
                          width: AppSizeHeight.s4,
                        ),
                        Container(
                          width: AppSizeWidth.s285,
                          child: Text_Utils(
                              maxlines: 10,
                              isUndeLine: false,
                              fontWeight: FontWeight.bold,
                              text: caseDiagnose.hospitalName,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // patient
                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.patient_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.hospitalUser,
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
                              text: caseDiagnose.patientName,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // Doctor

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
                              text: caseDiagnose.doctorName,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // Date

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.date_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidCalendarDays,
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
                              text: '${dateTime.year}/${dateTime.month}/${dateTime.day}',
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                      // Time

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.time_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidClock,
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
                              text:  '${dateTime.hour}:${dateTime.month}:${dateTime.second}',
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // Department Name


                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.departmentName_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.doorOpen,
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
                              text:  caseDiagnose.departmentName,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // location

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.location_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.locationDot,
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
                              text:  caseDiagnose.location,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // Clinical Examination

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.clinicalExamination_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.houseChimneyMedical,
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
                              text:  caseDiagnose.clinicalExamination,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: AppSizeHeight.s10,
                    ),
                    // Clinical Examination

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.diagnosis_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.personDotsFromLine,
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
                              text:  caseDiagnose.diagnosis,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),



                    // Diagnosis


                    // Notes
                    if (caseDiagnose.notes != null)

                      SizedBox(
                        height: AppSizeHeight.s10,
                      ),
                    // Clinical Examination

                    Text_Utils(
                        isUndeLine: false,
                        fontWeight: FontWeight.bold,
                        text: AppStrings.notes_,
                        color: ColorManager.black,
                        fontsize: FontSize.s22),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.notesMedical,
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
                              text:  caseDiagnose.notes!,
                              color: Colors.grey.shade700,
                              fontsize: FontSize.s15),
                        ),
                      ],
                    ),


                  ]),
            ),
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
