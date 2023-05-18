import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/network/controller/doctor_main_controller.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/doctor_details_cubit/data_table.dart';

import '../../routes/routes.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<DoctorMainController>();
    return Padding(
      padding:  EdgeInsets.all(AppSizeHeight.s8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSizeHeight.s12,),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      AppStrings.timeTable,
                      style: TextStyle(
                          fontSize: FontSize.s17, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: AppSizeHeight.s10,
            ),
            MyTable(
              data: homeController.convertToNestedList(),

            ),
            SizedBox(
              height: AppSizeHeight.s10,
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      AppStrings.todaysPatient,
                      style: TextStyle(
                          fontSize: FontSize.s17, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: AppSizeHeight.s10,
            ),
            Obx(() => ConditionalBuilder(
              condition: homeController.allPatientDataList.isNotEmpty,
              builder: (context) => Container(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(AppSizeHeight.s12),

                ),

                padding: EdgeInsets.all(AppSizeHeight.s4),
                width: double.infinity,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()  {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(AppPadding.p4),
                          // height: AppSizeHeight.s100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppPadding.p18),
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
                                  image: homeController.allPatientDataList[index].patientData.patientPP,
                                  hash: '${homeController.allPatientDataList[index].patientData.patientPPHash}',
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
                                    Text(
                                      '${homeController.allPatientDataList[index].patientData.firstName}',
                                      style: TextStyle(
                                        fontSize: FontSize.s20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Divider(),
                                    // Doctor Name
                                    Text(
                                      '${homeController.allPatientDataList[index].patientData.country}',
                                      style: TextStyle(
                                        fontSize: FontSize.s16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    //Date and time
                                    Text(
                                      'Age : ${homeController.allPatientDataList[index].patientData.age} years old',
                                      style: TextStyle(
                                        fontSize: FontSize.s14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${homeController.allPatientDataList[index].patientData.state}',
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
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height:
                      MediaQuery.of(context).size.height *0.01,
                    ),
                    itemCount:homeController.allPatientDataList.length),
              ),
              fallback: (context) => Container(
                  height: AppSizeHeight.s500,
                  child: Center(child: CircularProgressIndicator())),
            ))
          ],
        ),
      ),

    );
  }
}
