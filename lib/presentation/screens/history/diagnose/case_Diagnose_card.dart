import 'package:flutter/material.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;
import 'package:hospital/presentation/screens/history/diagnose/case_diagnose_report.dart';


class CaseDiagnoseCard extends StatelessWidget {
  const CaseDiagnoseCard({Key? key, required this.caseDiagnose})
      : super(key: key);
  final CaseDiagnose caseDiagnose;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(caseDiagnose.dateTime);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CaseDiagnoseReportScreen(
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
}
