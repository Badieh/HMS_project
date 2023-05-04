import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/book_appointments/book_appointments.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctor_details_cubit/data_table.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctor_details_cubit/top_doctors_details_cubit.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctor_details_cubit/top_doctors_details_stats.dart';
import 'package:readmore/readmore.dart';

class TopDoctorsDetailsScreen extends StatelessWidget {
  const TopDoctorsDetailsScreen({
    Key? key,
    required this.doctorModel,
  }) : super(key: key);
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    double cellHeight = MediaQuery.of(context).size.height * 0.05;

    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          TopDoctorsDetailsCubit()..getTopDoctorsDetails(docId: doctorModel.id),
      child: BlocConsumer<TopDoctorsDetailsCubit, TopDoctorsDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          //var doctorsDetailsCubit = TopDoctorsDetailsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_outlined),
                color: ColorManager.black,
              ),
              title: Text(doctorModel.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: FontSize.s20)),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.do_not_disturb_on_total_silence,
                    size: AppSizeHeight.s28,
                    color: ColorManager.green,
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: AppSizeHeight.s28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_outlined,
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
                          color: ColorManager.white,
                          borderRadius:
                              BorderRadius.circular(AppSizeHeight.s25)),
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: size.height * 0.17,
                            width: size.height * 0.17,
                            child: Image.network(
                                "https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png"),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
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
                                        doctorModel.specialty,
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
                                    color: ColorManager.primary,
                                    size: FontSize.s35,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.width * .16,
                                  width: MediaQuery.of(context).size.width * .3,
                                  decoration: BoxDecoration(
                                    color: ColorManager.lightPrimary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .005,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .18,
                                  child: Text(
                                    doctorModel.noOfPatient,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSize.s18,
                                        color: ColorManager.primary),
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
                                      color: ColorManager.grey,
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
                                    color: ColorManager.primary,
                                    size: FontSize.s35,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.width * .16,
                                  width: MediaQuery.of(context).size.width * .3,
                                  decoration: BoxDecoration(
                                    color: ColorManager.lightPrimary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .005,
                                ),
                                Container(
                                  child: Text(
                                    doctorModel.yearsOfExperience,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSize.s18,
                                        color: ColorManager.primary),
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
                                      color: ColorManager.grey,
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
                 data: [
                  ['Row 1, Column 1', 'Row 1, Column 2', 'Row 1, Column 3'],
                  ['Row 2, Column 1', 'Row 2, Column 2', 'Row 2, Column 3'],
                  ['Row 3, Column 1', 'Row 3, Column 2', 'Row 3, Column 3'],
                ],
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookAppointmentScreen(
                            title: AppStrings.bookAppointment,
                            clinicsScheduleList: [
                              clinicsScheduleModel_1,
                              clinicsScheduleModel_4,
                              clinicsScheduleModel_1,
                              clinicsScheduleModel_2,
                              clinicsScheduleModel_4,
                              clinicsScheduleModel_3,
                              clinicsScheduleModel_1,
                            ]),
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
      ),
    );
  }
}

