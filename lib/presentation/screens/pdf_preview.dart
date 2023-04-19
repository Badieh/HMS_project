import 'package:flutter/material.dart';
import 'package:hospital/models/caseDiagnoseModel.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:printing/printing.dart';

class PdfPreviewScreen extends StatelessWidget {
  const PdfPreviewScreen(
      {Key? key, required this.title, required this.caseDiagnose})
      : super(key: key);
  final String title;
  final CaseDiagnose caseDiagnose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: ColorManager.primary),
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        build: (format) =>
            generatePdf(title: title, caseDiagnose: caseDiagnose),
      ),
    );
  }
}