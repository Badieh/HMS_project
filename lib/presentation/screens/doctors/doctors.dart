import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_states.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';

class DoctorsScreen extends StatelessWidget {
  DoctorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<DoctorsCubit, DoctorsStates>(
        listener: (context, state) {
      //var doctorsCubit = DoctorsCubit.get(context);
    }, builder: (context, state) {
      var doctorsCubit = DoctorsCubit.get(context);
      // if (doctorsCubit.specialization == null &&
      //     doctorsCubit.degree == null &&
      //     doctorsCubit.position == null) {
      //   doctorsCubit.getDoctors();
      // }
      return Scaffold(
        backgroundColor:
            Get.isDarkMode ? ColorManager.black : ColorManager.lightPrimary,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              doctorsCubit.specialization = null;
              doctorsCubit.degree = null;
              doctorsCubit.position = null;
              doctorsCubit.favourites = false;
              Navigator.pop(context);
              //Get.offAllNamed(Routes.homeLayoutScreen);
            },
            icon: const Icon(Icons.arrow_back_outlined),
            color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
          ),
          title: Text(AppStrings.Doctors,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: FontSize.s20)),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeHeight.s12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppSizeHeight.s10,
                  ),
                  ConditionalBuilder(
                    condition: doctorsCubit.doctors.isNotEmpty,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * .9,
                      width: double.infinity,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var doctor = doctorsCubit.doctors[index];
                            // int keyDegree = doctor.degree.keys.elementAt(index);
                            // String valueDegree = doctor.degree[keyDegree]!;
                            // int keyPos = doctor.position.keys.elementAt(index);
                            // String valuePos = doctor.position[keyPos]!;
                            return InkWell(
                              onTap: () async {
                                doctorsCubit.selectedDoctor =
                                    doctorsCubit.doctors[index];
                                await doctorsCubit.getDoctorDetails(
                                    docId: doctorsCubit.doctors[index].id);
                                Get.toNamed(Routes.doctorDetails);

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
                                                height: size.height * .01,
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
                                                width: size.width * 0.24,
                                                child: AutoSizeText(
                                                  AppConstants.degrees[index],
                                                  style: TextStyle(
                                                    fontSize: FontSize.s14,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
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
                                                width: size.width * 0.24,
                                                child: AutoSizeText(
                                                  AppConstants.positions[index],
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
            )),
      );
    });
  }
}
