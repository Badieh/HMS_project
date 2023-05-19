import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_loading/card_loading.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_states.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';

class DoctorsScreen extends StatelessWidget {
  DoctorsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<DoctorsCubit, DoctorsStates>(
        listener: (context, state) {
      var doctorsCubit = DoctorsCubit.get(context);
      if (state is GetDoctorsErrorState) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: doctorsCubit.errorModel!.message,
            backgroundColor:
                Get.isDarkMode ? ColorManager.lightBlack : ColorManager.white,
            titleColor:
                Get.isDarkMode ? ColorManager.white : ColorManager.black,
            textColor: Get.isDarkMode ? ColorManager.white : ColorManager.black,
            confirmBtnColor:
                Get.isDarkMode ? ColorManager.white : ColorManager.primary,
            confirmBtnTextStyle: TextStyle(
              color: Get.isDarkMode ? ColorManager.black : ColorManager.white,
            ));
      }
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
              // Get.back();
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
        body: ConditionalBuilder(
          condition: doctorsCubit.doctors.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var doctor = doctorsCubit.doctors[index];
                  // int keyDegree = doctor.degree.keys.elementAt(index);
                  // String valueDegree = doctor.degree[keyDegree]!;
                  // int keyPos = doctor.position.keys.elementAt(index);
                  // String valuePos = doctor.position[keyPos]!;
                  return InkWell(
                    onTap: () async {
                      doctorsCubit.selectedDoctor = doctorsCubit.doctors[index];
                      await doctorsCubit.getDoctorDetails(
                          docId: doctorsCubit.doctors[index].doctorId);
                      Get.toNamed(Routes.doctorDetails);

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      //         DoctorDetailsScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: AppSizeHeight.s8, right: AppSizeHeight.s8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorManager.lightBlack
                              : ColorManager.white,
                          borderRadius:
                              BorderRadius.circular(AppSizeHeight.s25)),
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: AppSizeWidth.s90,
                            height: AppSizeHeight.s90,
                            child: Image.network(
                              doctor.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSizeHeight.s25)),
                          ),
                          SizedBox(
                            width: AppSizeWidth.s4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      doctor.fullName!,
                                      style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    color: ColorManager.primary,
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: AppSizeHeight.s20,
                                    ),
                                    onPressed: () {
                                      underDevelopment(context);
                                    },
                                  )
                                ],
                              ),
                              // Container(
                              //     width:
                              //         MediaQuery.of(context).size.width * 0.5,
                              //     child: Divider(
                              //       color: ColorManager.grey2,
                              //     )),

                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        AppConstants
                                            .specializations[doctor.specialty],
                                        style: TextStyle(
                                          fontSize: FontSize.s14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        doctor.hospitalName!,
                                        style: TextStyle(
                                          fontSize: FontSize.s14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppSizeHeight.s2,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.24,
                                      child: AutoSizeText(
                                        AppConstants.degrees[doctor.degree],
                                        style: TextStyle(
                                          fontSize: FontSize.s14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.24,
                                      child: AutoSizeText(
                                        AppConstants.positions[doctor.position],
                                        // 'Key: $key, Value: $value'
                                        style: TextStyle(
                                          fontSize: FontSize.s14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                      height: MediaQuery.of(context).size.height * .009,
                    ),
                itemCount: doctorsCubit.doctors.length),
          ),
          fallback: (context) =>
              screenLoading(context, '${doctorsCubit.specialization} doctos'),
        ),
      );
    });
  }
}
