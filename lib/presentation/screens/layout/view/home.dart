import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/doctors.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p12),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width * .15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? ColorManager.lightBlack
                    : ColorManager.veryLightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.searchScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .015,
                        ),
                        Icon(
                          Icons.search,
                          size: FontSize.s30,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .015,
                        ),
                        Text(
                          AppStrings.search,
                          style: TextStyle(
                              fontSize: FontSize.s14, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * .4,
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/a1.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    children: [
                      SizedBox(
                        width: AppSizeWidth.s150,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Text(
                            AppStrings.posterText,
                            style: TextStyle(
                                fontSize: FontSize.s20,
                                fontFamily: "Fjalla_One",
                                color: ColorManager.primary),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppSizeWidth.s150,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            AppStrings.posterdetails,
                            style: TextStyle(
                                fontSize: FontSize.s13,
                                fontFamily: "Fjalla_One",
                                color: ColorManager.darkGrey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      AppStrings.docSpeciality,
                      style: TextStyle(
                          fontSize: FontSize.s17, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.specializations);

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => SpecializationsScreen()));
                  },
                  child: Text(
                    AppStrings.seeAll,
                    style: TextStyle(
                        fontSize: FontSize.s13,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary),
                    textAlign: TextAlign.end,
                  ),
                )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * .3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.people,
                          size: FontSize.s35,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "General",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.tooth,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                          size: FontSize.s35,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "Dentist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.solidEye,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                          size: FontSize.s35,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "ophthalmologist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.nutritionix,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                          size: FontSize.s35,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "Nutrition",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.width * .25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * 0.16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.brain,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                          size: FontSize.s35,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "neurologist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.baby,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                          size: FontSize.s35,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "pediatrician",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.xRay,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                          size: FontSize.s35,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "radiologist",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          size: 30,
                          color: Get.isDarkMode
                              ? ColorManager.white
                              : ColorManager.primary,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * .18,
                        child: const Text(
                          "More",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text(
            //         AppStrings.Doctors,
            //         style: TextStyle(
            //             fontSize: FontSize.s17, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     TextButton(
            //         onPressed: () async {
            //           final doctorsCubit = context.read<DoctorsCubit>();
            //           await doctorsCubit.getDoctors();
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => DoctorsScreen()));
            //         },
            //         child: Text(
            //           AppStrings.seeAll,
            //           style: TextStyle(
            //               fontSize: FontSize.s13,
            //               fontWeight: FontWeight.bold,
            //               color: ColorManager.primary),
            //           textAlign: TextAlign.end,
            //         )),
            //   ],
            // ),
            Container(

              width:MediaQuery.of(context).size.width,
               alignment: Alignment.center,
               child : ElevatedButton(
                  onPressed: ()  async {
                    final doctorsCubit = context.read<DoctorsCubit>();
                    await doctorsCubit.getDoctors();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DoctorsScreen()));
                    },
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                      fixedSize: Size(MediaQuery.of(context).size.width, 25.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizeHeight.s10)),
                      elevation: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     Row(
                       children: [
                         FaIcon(FontAwesomeIcons.userDoctor,size: AppSizeHeight.s20,color: ColorManager.white ,),
                         SizedBox(width: AppSizeWidth.s8,),
                         Text("Hospital Doctors",
                             style: TextStyle(fontSize: FontSize.s15),
                             textAlign: TextAlign.center),
                       ],
                     ),
                      Icon(Icons.arrow_forward_ios,size:  AppSizeHeight.s20,)
                    ],
                  ),
                ),


            )
          ],
        ),
      ),
    );
  }
}
