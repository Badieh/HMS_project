import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hospital/network/controller/doctor_main_controller.dart';
import 'package:hospital/presentation/components/text_utils.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class PatienDetails extends StatelessWidget {
  PatienDetails({Key? key}) : super(key: key);
  var controller = Get.find<DoctorMainController>();
  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${controller.allPatientDataList[index].patientData.firstName} info',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,style: TextStyle(
          fontSize: FontSize.s20,
        ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(AppMargin.m10),
        padding: const EdgeInsets.all(AppPadding.p10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.p18),
          color: Get.isDarkMode
              ? ColorManager.lightBlack
              : ColorManager.veryLightGrey,
          image: DecorationImage(
            image: NetworkImage(
                '${controller.allPatientDataList[index].patientData.patientPP}'),
            opacity: 0.07,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Treatment Name

            // patient
            Text_Utils(
                isUndeLine: false,
                fontWeight: FontWeight.bold,
                text:'Full Name',
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                fontsize: FontSize.s22),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.kitMedical,
                  size: AppSizeHeight.s16,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: AppSizeWidth.s285,
                  child: Text_Utils(
                      maxlines: 10,
                      isUndeLine: false,
                      fontWeight: FontWeight.bold,
                      text:
                          '${controller.allPatientDataList[index].patientData.fullName}',
                      color: Get.isDarkMode
                          ? ColorManager.grey2
                          : Colors.grey.shade700,
                      fontsize: FontSize.s15),
                ),
              ],
            ),
            // Doctor Name

            SizedBox(
              height: AppSizeHeight.s4,
            ),
            Text_Utils(
                isUndeLine: false,
                fontWeight: FontWeight.bold,
                text: 'Address',
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                fontsize: FontSize.s22),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.userNurse,
                  size: AppSizeHeight.s16,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: AppSizeWidth.s285,
                  child: Text_Utils(
                      maxlines: 10,
                      isUndeLine: false,
                      fontWeight: FontWeight.bold,
                      text:
                          '${controller.allPatientDataList[index].patientData.address}',
                      color: Get.isDarkMode
                          ? ColorManager.grey2
                          : Colors.grey.shade700,
                      fontsize: FontSize.s15),
                ),
              ],
            ),

            // Start Date

            SizedBox(
              height: AppSizeHeight.s4,
            ),
            Text_Utils(
                isUndeLine: false,
                fontWeight: FontWeight.bold,
                text: '.startDate_',
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                fontsize: FontSize.s22),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendar,
                  size: AppSizeHeight.s16,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: AppSizeWidth.s285,
                  child: Text_Utils(
                      maxlines: 10,
                      isUndeLine: false,
                      fontWeight: FontWeight.bold,
                      text:
                          '${controller.allPatientDataList[index].patientData.birthDate}',
                      color: Get.isDarkMode
                          ? ColorManager.grey2
                          : Colors.grey.shade700,
                      fontsize: FontSize.s15),
                ),
              ],
            ),

            // End Date
            SizedBox(
              height: AppSizeHeight.s4,
            ),
            Text_Utils(
                isUndeLine: false,
                fontWeight: FontWeight.bold,
                text: "Age",
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                fontsize: FontSize.s22),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendarCheck,
                  size: AppSizeHeight.s16,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: AppSizeWidth.s285,
                  child: Text_Utils(
                      maxlines: 10,
                      isUndeLine: false,
                      fontWeight: FontWeight.bold,
                      text:
                          '${controller.allPatientDataList[index].patientData.age} years old',
                      color: Get.isDarkMode
                          ? ColorManager.grey2
                          : Colors.grey.shade700,
                      fontsize: FontSize.s15),
                ),
              ],
            ),
            // Dose

            SizedBox(
              height: AppSizeHeight.s4,
            ),
            Text_Utils(
                isUndeLine: false,
                fontWeight: FontWeight.bold,
                text: 'Blood Type',
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                fontsize: FontSize.s22),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.listOl,
                  size: AppSizeHeight.s16,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: AppSizeWidth.s285,
                  child: Text_Utils(
                      maxlines: 10,
                      isUndeLine: false,
                      fontWeight: FontWeight.bold,
                      text:
                          '${controller.allPatientDataList[index].patientData.bloodType}',
                      color: Get.isDarkMode
                          ? ColorManager.grey2
                          : Colors.grey.shade700,
                      fontsize: FontSize.s15),
                ),
              ],
            ),

            // Instructuins
            SizedBox(
              height: AppSizeHeight.s4,
            ),
            Text_Utils(
                isUndeLine: false,
                fontWeight: FontWeight.bold,
                text: 'Gender',
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                fontsize: FontSize.s22),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidFileLines,
                  size: AppSizeHeight.s16,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: AppSizeWidth.s285,
                  child: Text_Utils(
                      maxlines: 10,
                      isUndeLine: false,
                      fontWeight: FontWeight.bold,
                      text:
                          '${controller.allPatientDataList[index].patientData.gender}',
                      color: Get.isDarkMode
                          ? ColorManager.grey2
                          : Colors.grey.shade700,
                      fontsize: FontSize.s15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
