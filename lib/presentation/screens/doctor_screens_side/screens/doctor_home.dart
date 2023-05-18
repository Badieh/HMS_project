import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
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

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         DoctorDetailsScreen()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: AppSizeHeight.s8,
                                right: AppSizeHeight.s8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? ColorManager.lightBlack
                                    : ColorManager.white,
                                borderRadius: BorderRadius.circular(
                                    AppSizeHeight.s25)),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: AppSizeWidth.s90,
                                  height: AppSizeHeight.s90,
                                  child: Image.network(doctor.imageUrl),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppSizeHeight.s25)),
                                ),
                                SizedBox(
                                  width: AppSizeWidth.s4,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: AppSizeHeight.s18,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            doctor.name,
                                            style: TextStyle(
                                              fontSize: FontSize.s14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Icon(
                                            Icons.favorite_border,
                                            color: ColorManager.primary,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.5,
                                        child: Divider(
                                          color: ColorManager.grey2,
                                        )),
                                    SizedBox(
                                      height: AppSizeHeight.s2,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            child: Text(
                                              doctor.specialty,
                                              style: TextStyle(
                                                fontSize: FontSize.s14,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * .01,
                                          ),
                                          SizedBox(
                                            child: Text(
                                              doctor.hospitalName,
                                              style: TextStyle(
                                                fontSize: FontSize.s14,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSizeHeight.s12,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.5,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.24,
                                            child: AutoSizeText(
                                              '$valueDegree' ,
                                              style: TextStyle(
                                                fontSize: FontSize.s14,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.02,
                                            child: AutoSizeText(
                                              "|",
                                              style: TextStyle(
                                                fontSize: FontSize.s14,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.24,
                                            child: AutoSizeText(
                                              '$valuePos',
                                              // 'Key: $key, Value: $value'
                                              style: TextStyle(
                                                fontSize: FontSize.s14,
                                              ),
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                        color: Colors.transparent,
                        height:
                        MediaQuery.of(context).size.height * .009,
                      ),
                      itemCount: doctorsCubit.doctors.length),
                ),
                fallback: (context) => Container(
                    height: AppSizeHeight.s500,
                    child: Center(child: CircularProgressIndicator())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
