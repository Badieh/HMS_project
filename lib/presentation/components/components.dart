import 'dart:ui';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;
import 'package:blurhash/blurhash.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/models/article_model.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/models/file_model.dart';
import 'package:hospital/models/treatment_model.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/articles/webview.dart';
import 'package:hospital/presentation/screens/history/case_diagnose.dart';
import 'package:hospital/presentation/screens/pdf_preview.dart';

import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart' as synPdf;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:permission_handler/permission_handler.dart';

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
        required AppointmentState appointmentState}) =>
    Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      height: AppSizeHeight.s100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
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
            child: flutter_blurhash.BlurHash(
              image: ImageAssets.doctorPlaceHolder,
              hash: ImageAssets.imageHashPlaceHolder,
              duration: const Duration(milliseconds: 500),
              imageFit: BoxFit.cover,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Date",
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
                      "Time",
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

Widget buildArticleCard(
    {required double height,
    required double width,
    required ArticleModel article,
    required context}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewExample(url: article.url),
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: width * 0.2,
              height: height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // image: DecorationImage(
                //     image: article.urlToImage != null
                //         ? NetworkImage(
                //             '${article.urlToImage}',
                //           )
                //         : const AssetImage(
                //             ImageAssets.imageNotFound,
                //           ) as ImageProvider,
                //     onError: (exception, stackTrace) {
                //       // Display a fallback image or an error message
                //       return;
                //     },
                //     fit: BoxFit.cover),
              ),
              child: flutter_blurhash.BlurHash(
                image: article.urlToImage,
                hash: article.imageHash,
                duration: const Duration(milliseconds: 500),
                imageFit: BoxFit.cover,
              )),
          SizedBox(
            width: width * 0.07,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
              height: height * 0.11,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(article.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    Text(
                      article.publishedAt,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.03,
                          color: Colors.grey),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildListOfArticles(
        {required double height,
        required double width,
        required List<ArticleModel> articles,
        isSearch = false}) =>
    ConditionalBuilder(
        condition: articles.isNotEmpty,
        builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleCard(
                height: height,
                width: width,
                article: articles[index],
                context: context),
            separatorBuilder: (context, index) => separator(),
            itemCount: 10),
        fallback: (context) => isSearch
            ? Container(
                child: Center(
                    child: Text(
                  'Developed by Badieh Nader',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              )
            : Center(child: CircularProgressIndicator()));

Widget separator() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

Widget caseDiagnoseCard({
  required BuildContext context,
  required CaseDiagnose caseDiagnose,
}) {
  DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaseDiagnoseScreen(
              caseDiagnose: caseDiagnose,
            ),
          ));
    },
    child: Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      // height: AppSizeHeight.s100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p18),
        color: ColorManager.veryLightGrey,
      ),
      child: Row(
        children: [
          // Department photo
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.p18),
              //color: ColorManager.grey,
            ),
            width: AppSizeWidth.s90,
            height: AppSizeHeight.s100,
            child: flutter_blurhash.BlurHash(
              image: caseDiagnose.departmentIconUrl,
              hash: caseDiagnose.departmentIconHash,
              imageFit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 45,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Department Name
                Center(
                  child: Text(
                    caseDiagnose.departmentName,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Doctor Name
                Text(
                  caseDiagnose.doctorName,
                  style: TextStyle(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                //Date and time
                Text(
                  'Date: ${dateTime.year}/${dateTime.month}/${dateTime.day}',
                  style: TextStyle(
                    fontSize: FontSize.s14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Time: ${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
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
      ),
    ),
  );
}

Widget treatmentCard({
  required BuildContext context,
  required Treatment treatment,
}) {
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

Future<String> generateImageHash(String url) async {
  ByteData bytes = await NetworkAssetBundle(Uri.parse(url)).load(url);
  Uint8List pixels = bytes.buffer.asUint8List();
  var blurHash = await BlurHash.encode(pixels, 4, 3);
  return blurHash;
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

Widget fileCard({required FileModel fileModel, required context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(
              url: fileModel.fileUrl,
              title: fileModel.fileName,
            ),
          ));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: AppSizeWidth.s65,
              // height: AppSizeWidth.s50,
              decoration: BoxDecoration(
                color: ColorManager.veryLightGrey,
                borderRadius: BorderRadius.circular(AppPadding.p10),
                border: Border.all(
                  color: ColorManager.secondary,
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     ColorManager.primary,
                //     ColorManager.secondary,
                //     ColorManager.white,
                //   ],
                // ),
              ),
              child: Icon(
                Icons.file_copy,
                color: ColorManager.primary,
                size: AppSizeHeight.s30,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          Text(
            fileModel.fileName,
            style: TextStyle(
              fontSize: FontSize.s16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}

Future<Uint8List> generatePdf(
    {required String title, CaseDiagnose? caseDiagnose}) async {
  var pdf = pw.Document(
    title: title,
  );
  if (caseDiagnose != null) {
    await caseDiagnoseReport(pdf: pdf, caseDiagnose: caseDiagnose);
  }

  return pdf.save();
}

Future<Uint8List> printPdf(String pdfName) async {
  File file = await downloadPdf(
      url:
          'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      fileName: 'test.pdf');

  return file.readAsBytes();
}

Future<File> downloadPdf(
    {required String url, required String fileName}) async {
  late String filePath;

  var file = File('');

  // Platform.isIOS comes from dart:io
  if (Platform.isIOS) {
    final dir = await getApplicationDocumentsDirectory();
    filePath = '${dir.path}/$fileName';
    file = File(filePath);
  }
  if (Platform.isAndroid) {
    var status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.storage.request();
    }
    if (status.isGranted) {
      const downloadsFolderPath = '/storage/emulated/0/Download/';
      Directory dir = Directory(downloadsFolderPath);
      filePath = '${dir.path}/$fileName';
      file = File('${dir.path}/$fileName');
    }
  }

  // load file that you want to save on user's phone
  final response = await Dio().get(url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
      ));
  try {
    await file.writeAsBytes(response.data.buffer
        .asUint8List(response.data.offsetInBytes, response.data.lengthInBytes));
    print('dowmloaded succesfuly in : $filePath');
  } on FileSystemException catch (err) {
    print(err.toString());
    // handle error
  }
  return file;
}
