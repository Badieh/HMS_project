import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(AppPadding.p10),
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.015,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.02,
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * .15,
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .15,
                    child: Image.asset("assets/images/profile.png"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning 👋"),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.009,
                      ),
                      Text(
                        "Andrew Ainsley",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .15,
                  ),
                  Icon(
                    Icons.notifications_active_outlined,
                    size: 28.sp,
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .02,
                  ),
                  Icon(Icons.favorite_border, size: 28.sp)
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .015,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery
                    .of(context)
                    .size
                    .width * .15,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .85,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .015,
                    ),
                    Icon(
                      Icons.search,
                      size: 30.sp,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .015,
                    ),
                    Text(
                      "Search",
                      style:
                      TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .5,
                    ),
                    Icon(Icons.filter_alt_outlined, color: Colors.blue)
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .015,
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * .4,
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .85,
                    child: Image.asset(
                      "assets/images/a1.jpg",
                      fit: BoxFit.fill,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlueAccent.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                          const Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Check Now",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(130.w, 30.h),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .02,
                  ),
                  Expanded(
                      child: Text(
                        "Doctor Speciality",
                        style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        textAlign: TextAlign.end,
                      )),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .02,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .015,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .width * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Icon(
                            Icons.people,
                            size: 35.sp,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "General",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/tooth.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "Dentist",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/eye.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "ophthalmologist",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/nutrition.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "Nutrition",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                height: MediaQuery
                    .of(context)
                    .size
                    .width * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/neurology.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "neurologist",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/pediatrics.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "pediatrician",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/radiology.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "radiologist",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Icon(
                            Icons.more_horiz,
                            size: 30,
                          ),
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .005,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .18,
                          child: const Text(
                            "More",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                        "Top Doctors",
                        style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        textAlign: TextAlign.end,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
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
                    width: MediaQuery.of(context).size.width/80,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        "General",
                        style: TextStyle(
                            fontSize: 15.sp, color: ColorManager.primary),
                        textAlign: TextAlign.center
                    ),
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
                    width: MediaQuery.of(context).size.width/80,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        "Dentist",
                        style: TextStyle(
                            fontSize: 15.sp, color: ColorManager.primary),
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
                    width: MediaQuery.of(context).size.width/80,
                  ),
                   ElevatedButton(
                      onPressed: () {},
                      child: Text(
                          "nutritionist",
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.primary),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}