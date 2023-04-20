import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPreviewDevice extends StatelessWidget {
  const PdfPreviewDevice({
    Key? key,
    required this.file,
    required this.cubit,
  }) : super(key: key);
  final File file;
  final HistoryCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.file(file),
      floatingActionButton: FloatingActionButton(
        isExtended: false,
        elevation: 2.0,
        hoverElevation: 6.0,
        focusElevation: 6.0,
        onPressed: () async {
          await cubit.uploadFile().then((value) => QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'File uploaded succesfuly',
              ));
        },
        child: const Icon(Icons.upload),
        // mini: false,
      ),
    );
  }
}
