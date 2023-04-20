import 'package:flutter/material.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:printing/printing.dart';

class PdfPrintingScreen extends StatelessWidget {
  const PdfPrintingScreen(
      {Key? key, required this.title, this.caseDiagnose, this.imagePathsList})
      : super(key: key);
  final String title;
  final CaseDiagnose? caseDiagnose;
  final List<String>? imagePathsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: ColorManager.primary),
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        build: (format) => generatePdf(
          title: title,
          caseDiagnose: caseDiagnose,
          imagePathsList: imagePathsList,
        ),
      ),
    );
  }
}
