import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital/models/caseDiagnoseModel.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPreviewScreen extends StatelessWidget {
  const PdfPreviewScreen(
      {Key? key, required this.title, required this.caseDiagnose})
      : super(key: key);
  final String title;
  final CaseDiagnose caseDiagnose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(title), backgroundColor: ColorManager.primary),
        body: FutureBuilder<File>(
          future: printExistingPdf(''),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SfPdfViewer.file(snapshot.data!);
            } else if (snapshot.hasError) {
              return const Text('Error loading PDF file');
            } else {
              return const Text('Loading PDF file...');
            }
          },
        ));
  }
}
// SfPdfViewer.network(
// url != ''
// ? url
//     : 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
// ),
