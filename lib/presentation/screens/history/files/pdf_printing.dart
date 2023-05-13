import 'package:flutter/material.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:printing/printing.dart';
import 'package:quickalert/quickalert.dart';

class PdfPrintingScreen extends StatelessWidget {
  const PdfPrintingScreen(
      {Key? key,
      required this.title,
      this.caseDiagnose,
      this.imagePathsList,
      this.cubit})
      : super(key: key);
  final String title;
  final CaseDiagnose? caseDiagnose;
  final List<String>? imagePathsList;
  final HistoryCubit? cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        build: (format) => generatePdf(
          title: title,
          caseDiagnose: caseDiagnose,
          imagePathsList: imagePathsList,
        ),
        onPrinted: (BuildContext context) {
          Navigator.pop(context);

          if (imagePathsList != null && cubit != null) {
            QuickAlert.show(
              context: context,
              barrierDismissible: false,
              type: QuickAlertType.success,
              width: MediaQuery.of(context).size.width,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pdf Created!',
                      style: TextStyle(
                          fontSize: FontSize.s22, fontWeight: FontWeight.bold)),
                  Text('please upload the pdf file',
                      style: TextStyle(
                          fontSize: FontSize.s20, fontWeight: FontWeight.w500)),
                ],
              ),
              animType: QuickAlertAnimType.slideInDown,
            );
          }
        },
      ),
    );
  }
}
