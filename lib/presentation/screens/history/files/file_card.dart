import 'package:flutter/material.dart';
import 'package:hospital/models/file_model.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/pdf_preview_cloud.dart';

class FileCard extends StatelessWidget {
  const FileCard({Key? key, required this.fileModel}) : super(key: key);
  final FileModel fileModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfPreviewCloudScreen(
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
}
