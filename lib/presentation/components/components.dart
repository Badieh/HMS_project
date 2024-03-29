import 'dart:async';
import 'dart:io';

import 'package:card_loading/card_loading.dart';
import 'package:dio/dio.dart';
import 'package:blurhash/blurhash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/style_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/history/diagnose/case_diagnose_report.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';

Widget DefaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  IconData? prefixIcon,
  TextAlign textAlign = TextAlign.start,
  bool autoFocus = false,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  required FormFieldValidator<String>? validator,
  required ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  bool isPassword = false,
  TextInputAction? TextInputAction,
  bool readOnly = false,
  bool enabled = true,
  bool hideError = false,
}) =>
    TextFormField(
      textAlign: textAlign,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autoFocus,
      textInputAction: TextInputAction,
      decoration: InputDecoration(
        fillColor:
            Get.isDarkMode ? ColorManager.lightBlack : ColorManager.lightGrey,
        labelText: label,
        labelStyle: TextStyle(
            color: Get.isDarkMode ? ColorManager.secondary : ColorManager.grey),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                size: 25,
                color:
                    Get.isDarkMode ? ColorManager.primary : ColorManager.black,
              ),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                icon: Icon(
                  suffixIcon,
                  color: Get.isDarkMode
                      ? ColorManager.secondary
                      : ColorManager.grey,
                ),
                onPressed: suffixPressed,
              ),

        // error style
        errorStyle: hideError
            ? getRegularStyle(color: ColorManager.error, fontSize: 0)
            : getRegularStyle(
                color: ColorManager.error, fontSize: FontSize.s14),
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

Widget separator() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

Future<String> generateImageHash(String url) async {
  ByteData bytes = await NetworkAssetBundle(Uri.parse(url)).load(url);
  Uint8List pixels = bytes.buffer.asUint8List();
  var blurHash = await BlurHash.encode(pixels, 4, 3);
  return blurHash;
}

Future<Uint8List> generatePdf(
    {required String title,
    CaseDiagnose? caseDiagnose,
    List<String>? imagePathsList}) async {
  var pdf = pw.Document(
    title: title,
  );
  // if we send a case diagnose report to generate report
  if (caseDiagnose != null) {
    await caseDiagnoseReport(pdf: pdf, caseDiagnose: caseDiagnose);
  }
  // if we send an image to convert it to pdf
  else if (imagePathsList != null && imagePathsList.length == 1) {
    final image = pw.MemoryImage(
      File(imagePathsList.first).readAsBytesSync(),
    );
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(
        child: pw.Image(image),
      ); // Center
    })); //
  }
  // if we send multiple images to convert them into 1 pdf
  else if (imagePathsList != null) {
    imagePathsList.forEach((element) {
      final image = pw.MemoryImage(
        File(element).readAsBytesSync(),
      );
      pdf.addPage(pw.Page(build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        ); // Center
      }));
    });
  }

  return pdf.save();
}

Future<Uint8List> printPdf(String pdfName, String url) async {
  File file = await downloadPdf(
      url: url != ''
          ? url
          : 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
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

SnackbarController snackbar({required String message, bool isSuccess = true}) =>
    Get.snackbar(
      "Success",
      message,
      backgroundColor: isSuccess ? ColorManager.success : ColorManager.error,
      colorText: Colors.white,
      icon: isSuccess
          ? Icon(Icons.check_circle_rounded, color: Colors.white)
          : Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );

// screenLoading()=> Container(
//   color: ColorManager.white,
//   child: CustomScrollView(
//     physics: const BouncingScrollPhysics(),
//     slivers: [
//       SliverPadding(
//         padding: const EdgeInsets.all(20),
//         sliver: SliverList(
//           delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     CardLoading(
//                       height: 30,
//                       borderRadius:
//                       BorderRadius.all(Radius.circular(15)),
//                       width: 100,
//                       margin: EdgeInsets.only(bottom: 10),
//                     ),
//                     CardLoading(
//                       height: 100,
//                       borderRadius:
//                       BorderRadius.all(Radius.circular(15)),
//                       margin: EdgeInsets.only(bottom: 10),
//                     ),
//                     CardLoading(
//                       height: 30,
//                       width: 200,
//                       borderRadius:
//                       BorderRadius.all(Radius.circular(15)),
//                       margin: EdgeInsets.only(bottom: 10),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             childCount: 10,
//           ),
//         ),
//       ),
//     ],
//   ),
// );

Widget screenLoading(BuildContext context, String message) {
  Timer(const Duration(seconds: 5), () {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'There is no $message availble',
        backgroundColor:
            Get.isDarkMode ? ColorManager.lightBlack : ColorManager.white,
        titleColor: Get.isDarkMode ? ColorManager.white : ColorManager.black,
        textColor: Get.isDarkMode ? ColorManager.white : ColorManager.black,
        onConfirmBtnTap: () {
          Get.offAllNamed(Routes.homeLayoutScreen);
        },
        confirmBtnColor:
            Get.isDarkMode ? ColorManager.white : ColorManager.primary,
        confirmBtnTextStyle: TextStyle(
          color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
        ));
  });

  return Container(
    color: Colors.white,
    child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CardLoading(
                        height: 30,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        width: 100,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      CardLoading(
                        height: 100,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      CardLoading(
                        height: 30,
                        width: 200,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                    ],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    ),
  );
}

underDevelopment(context) => QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'Feature Under Development',
    backgroundColor:
        Get.isDarkMode ? ColorManager.lightBlack : ColorManager.white,
    titleColor: Get.isDarkMode ? ColorManager.white : ColorManager.black,
    textColor: Get.isDarkMode ? ColorManager.white : ColorManager.black,
    confirmBtnColor: Get.isDarkMode ? ColorManager.white : ColorManager.primary,
    confirmBtnTextStyle: TextStyle(
      color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
    ));
