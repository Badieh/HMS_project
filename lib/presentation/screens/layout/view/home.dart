import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/presentation/screens/top_doctors.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(AppPadding.p12),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * .15,
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width * .15,
                        child: Image.asset("assets/images/profile.png"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.welcomeMessage),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.009,
                          ),
                          Text(
                            AppStrings.userName,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        size:  FontSize.s28,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      Icon(Icons.favorite_border, size: FontSize.s28)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * .15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
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
                              fontSize:FontSize.s14, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    Icon(Icons.filter_alt_outlined, color: Colors.blue)
                  ],
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
                  SizedBox(
                    width: AppSizeWidth.s200,
                    child: Padding(
                      padding: EdgeInsets.all(AppPadding.p8),
                      child: Text(
                        AppStrings.posterText,
                        style: TextStyle(
                            fontSize: FontSize.s25,

                            color: ColorManager.primary),
                      ),
                    ),
                  )
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
                      child: Text(
                    AppStrings.seeAll,
                    style: TextStyle(
                        fontSize: FontSize.s13,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    textAlign: TextAlign.end,
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
                          child: Icon(
                            Icons.people,
                            size: FontSize.s35,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                          child: SvgPicture.asset(
                            "assets/icons/tooth.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                          child: SvgPicture.asset(
                            "assets/icons/eye.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                          child: SvgPicture.asset(
                            "assets/icons/nutrition.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                height: MediaQuery.of(context).size.width * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            "assets/icons/neurology.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.width * 0.18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                          child: SvgPicture.asset(
                            "assets/icons/pediatrics.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                          child: SvgPicture.asset(
                            "assets/icons/radiology.svg",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
                          child: const Icon(
                            Icons.more_horiz,
                            size: 30,
                          ),
                          height: MediaQuery.of(context).size.width * .18,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
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
              Row(
                children: [

                  Expanded(
                    child: Text(
                      AppStrings.topDoctors,
                      style: TextStyle(
                          fontSize: FontSize.s17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Top_Doctors_Screen()));
                      },
                      child: Text(
                        AppStrings.seeAll,
                        style: TextStyle(
                            fontSize: FontSize.s13,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        textAlign: TextAlign.end,
                      )),

                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("All",
                          style: TextStyle(fontSize: FontSize.s15),
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
                              fontSize: FontSize.s15, color: ColorManager.primary),
                          textAlign: TextAlign.center),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(90.w, 30.h),
                          side:
                              BorderSide(color: ColorManager.primary, width: 2),
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
                              fontSize:  FontSize.s15, color: ColorManager.primary),
                          textAlign: TextAlign.center),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(80.w, 30.h),
                          side:
                              BorderSide(color: ColorManager.primary, width: 2),
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
                              fontSize:  FontSize.s15, color: ColorManager.primary),
                          textAlign: TextAlign.center),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(90.w, 30.h),
                          side:
                              BorderSide(color: ColorManager.primary, width: 2),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
