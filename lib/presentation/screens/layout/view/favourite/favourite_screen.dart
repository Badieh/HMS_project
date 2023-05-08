import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/top_doctors/cubit/top_doctors_cubit.dart';
import 'package:hospital/presentation/screens/top_doctors/cubit/top_doctors_stats.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctors_details.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(AppStrings.favouriteScreentitle,style: TextStyle(fontSize: FontSize.s20),),
        ),
        body: Container(
          decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: ColorManager.lightPrimary,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.only(top: AppPadding.p6),
          height: MediaQuery.of(context).size.height ,
          width: double.infinity,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var doctor = doctorsCubit.topDoctors[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TopDoctorsDetailsScreen(
                              doctorModel: doctorsCubit.topDoctors[index],
                            )));
                  },
                  child: Container(

                    padding: EdgeInsets.only(
                        left: AppSizeHeight.s8, right: AppSizeHeight.s8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSizeHeight.s25)),
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: AppSizeWidth.s120,
                          height: AppSizeHeight.s120,
                          child: Image.network(doctor.imageUrl),
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
                              width: MediaQuery.of(context).size.width * 0.5,
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
                                    Icons.favorite,
                                    color: ColorManager.primary,
                                  )
                                ],
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
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.24,
                                    child: AutoSizeText(
                                      doctor.degree,
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
                                      doctor.position,
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
              itemCount: doctorsCubit.topDoctors.length),
        ),
      );
    });
  }
}
