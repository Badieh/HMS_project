import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPreviewCloudScreen extends StatelessWidget {
  const PdfPreviewCloudScreen({Key? key, required this.url, required this.title})
      : super(key: key);
  final String url;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: ColorManager.primary),
      body: SfPdfViewer.network(
        url != ''
            ? url
            : 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: false,
        elevation: 2.0,
        hoverElevation: 6.0,
        focusElevation: 6.0,
        onPressed: () async {
          await Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async =>
                  await printPdf(title, url));
        },
        child: const FaIcon(FontAwesomeIcons.download),
        // mini: false,
      ),
    );
  }
}
// FutureBuilder<File>(
// future: printExistingPdf(''),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// return SfPdfViewer.file(snapshot.data!);
// } else if (snapshot.hasError) {
// return const Text('Error loading PDF file');
// } else {
// return const Text('Loading PDF file...');
// }
// },
// ));
