import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/book_appointments/book_appointments.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_cubit.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_states.dart';
import 'package:hospital/presentation/screens/doctors/doctor_details_cubit/data_table.dart';

import 'package:readmore/readmore.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    double cellHeight = MediaQuery.of(context).size.height * 0.05;

    var size = MediaQuery.of(context).size;
    return BlocConsumer<DoctorsCubit, DoctorsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        DoctorsCubit cubit = DoctorsCubit.get(context);
        final DoctorModel doctorModel = cubit.selectedDoctor;
        int keyDegree = cubit.selectedDoctor.id;
        String valueDegree = doctorModel.degree[keyDegree]!;
        int keyPos = cubit.selectedDoctor.id;
        String valuePos = doctorModel.position[keyPos]!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined),
            ),
            title: Text(doctorModel.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: FontSize.s20)),
            actions: [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.do_not_disturb_on_total_silence,
              //     size: AppSizeHeight.s28,
              //     color: ColorManager.success,
              //   ),
              // ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: AppSizeHeight.s28,
                ),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(
                left: AppSizeHeight.s8,
                right: AppSizeHeight.s8,
                top: AppSizeHeight.s8),
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: AppSizeHeight.s8, right: AppSizeHeight.s8),
                    width: double.infinity,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode ?  ColorManager.lightBlack:ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: size.height * 0.17,
                          width: size.height * 0.17,
                          child: Image.network(doctorModel.imageUrl),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSizeHeight.s25)),
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
                              width: size.width * 0.5,
                              child: Text(
                                doctorModel.name,
                                style: TextStyle(
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Divider(
                                  color: ColorManager.grey2,
                                )),
                            SizedBox(
                              height: AppSizeHeight.s2,
                            ),
                            Container(
                              width: size.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: AutoSizeText(
                                      '$valueDegree',
                                      style: TextStyle(
                                        fontSize: FontSize.s12,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  SizedBox(
                                    child: AutoSizeText(
                                      '$valuePos',
                                      style: TextStyle(
                                        fontSize: FontSize.s12,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  SizedBox(
                                    child: AutoSizeText(
                                      doctorModel.hospitalName,
                                      style: TextStyle(
                                        fontSize: FontSize.s12,
                                      ),
                                      maxLines: 2,
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
                  SizedBox(
                    height: size.height * .005,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: FaIcon(
                                  FontAwesomeIcons.peopleGroup,
                                  color: Get.isDarkMode ? ColorManager.white: ColorManager.primary,
                                  size: FontSize.s35,
                                ),
                                height: MediaQuery.of(context).size.width * .16,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                  color:Get.isDarkMode ? ColorManager.lightBlack: ColorManager.lightPrimary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .18,
                                child: Text(
                                 doctorModel.noOfPatient.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontSize.s18,
                                    color: Get.isDarkMode ? ColorManager.white: ColorManager.primary,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005,
                              ),
                              Container(
                                child: Text(
                                  AppStrings.noofpatient_txt,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Get.isDarkMode ? ColorManager.primary: ColorManager.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.auto_graph,
                                  color: Get.isDarkMode ? ColorManager.white: ColorManager.primary,
                                  size: FontSize.s35,
                                ),
                                height: MediaQuery.of(context).size.width * .16,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                  color:Get.isDarkMode ? ColorManager.lightBlack: ColorManager.lightPrimary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005,
                              ),
                              Container(
                                child: Text(
                                  doctorModel.yearsOfExperience.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontSize.s18,
                                    color: Get.isDarkMode ? ColorManager.white: ColorManager.primary,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005,
                              ),
                              Container(
                                child: Text(
                                  AppStrings.yearsofexperience_txt,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Get.isDarkMode ? ColorManager.primary: ColorManager.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text(
                    AppStrings.aboutthedoctor,
                    style: TextStyle(
                        fontSize: FontSize.s18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  ReadMoreText(
                    doctorModel.aboutMe,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: AppStrings.viewmore,
                    trimExpandedText: AppStrings.viewless,
                    trimLines: 4,
                    lessStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary),
                    moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary),
                    style: TextStyle(
                        fontSize: FontSize.s14, height: AppSizeHeight.s1_5),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Text(
                    AppStrings.workTime,
                    style: TextStyle(
                        fontSize: FontSize.s18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  MyTable(
                    data: cubit.convertToNestedList(),
                  ),
                  SizedBox(
                    height: size.height * .015,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: AppSizeHeight.s60,
            color: ColorManager.white,
            child: ElevatedButton(
              onPressed: () {
                // Get.toNamed(Routes.bookAppointment);
                final bookAppointmentCubit =
                    context.read<BookAppointmentCubit>();
                bookAppointmentCubit.getTimesOfDay(date: DateTime.now());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookAppointmentScreen(
                        title: AppStrings.bookAppointment,
                      ),
                    ));
              },
              child: Text(
                AppStrings.bookAppointment,
                style: TextStyle(
                    fontSize: FontSize.s16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
