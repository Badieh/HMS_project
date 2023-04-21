import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/top_doctors/cubit/top_doctors_cubit.dart';
import 'package:hospital/presentation/screens/top_doctors/cubit/top_doctors_stats.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class Top_Doctors_Screen extends StatelessWidget {
  const Top_Doctors_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<TopDoctorsCubit, TopDoctorsState>(
        listener: (context, state) {
      // var doctorsCubit = TopDoctorsCubit.get(context);
      // doctorsCubit.getTopDoctors();
    }, builder: (context, state) {
      var doctorsCubit = TopDoctorsCubit.get(context);
      return Scaffold(
        backgroundColor: ColorManager.lightGrey,
        appBar: AppBar(
          backgroundColor: ColorManager.lightGrey,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined),
            color: ColorManager.black,
          ),
          title: Text("Top Doctors",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: FontSize.s20)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: ColorManager.black)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined,
                    color: ColorManager.black)),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(AppSizeHeight.s12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("All",
                              style: TextStyle(fontSize: 15.sp),
                              textAlign: TextAlign.center),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(50.w, 30.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 2),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 80,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("General",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: ColorManager.primary),
                              textAlign: TextAlign.center),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(90.w, 30.h),
                              side: BorderSide(
                                  color: ColorManager.primary, width: 2),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 2),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 80,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Dentist",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: ColorManager.primary),
                              textAlign: TextAlign.center),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(80.w, 30.h),
                              side: BorderSide(
                                  color: ColorManager.primary, width: 2),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 2),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 80,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("nutritionist",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: ColorManager.primary),
                              textAlign: TextAlign.center),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(90.w, 30.h),
                              side: BorderSide(
                                  color: ColorManager.primary, width: 2),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizeHeight.s12,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .8,
                    width: double.infinity,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var doctor = doctorsCubit.topDoctors[index];
                          return Container(
                            padding: EdgeInsets.only(
                                left: AppSizeHeight.s8,
                                right: AppSizeHeight.s8),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius:
                                    BorderRadius.circular(AppSizeHeight.s25)),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  height: MediaQuery.of(context).size.height *
                                      0.17,
                                  width: MediaQuery.of(context).size.height *
                                      0.17,
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
                                      width:
                                          MediaQuery.of(context).size.width *
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
                                      width:
                                          MediaQuery.of(context).size.width *
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
                                              overflow: TextOverflow.ellipsis,
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
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppSizeHeight.s12,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                      child: Row(
                                        children: [
                                          Text(
                                            doctor.Degree,
                                            style: TextStyle(
                                              fontSize: FontSize.s14,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            " | ",
                                            style: TextStyle(
                                              fontSize: FontSize.s14,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            doctor.Position,
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
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                              color: Colors.transparent,
                              height:
                                  MediaQuery.of(context).size.height * .009,
                            ),
                        itemCount: doctorsCubit.topDoctors.length),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
