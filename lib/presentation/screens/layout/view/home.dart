import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/presentation/screens/layout/view/search.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p12),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width * .15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorManager.veryLightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Search_Screen()));
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
                    Icon(Icons.filter_alt_outlined, color: ColorManager.primary)
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
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: AppSizeWidth.s150,
                      child: Padding(
                        padding: EdgeInsets.all(AppPadding.p8),
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
                        padding: EdgeInsets.all(AppPadding.p8),
                        child: Text(
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
                      color: ColorManager.primary),
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
                          color: ColorManager.primary,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: FaIcon(
                          FontAwesomeIcons.tooth,
                          color: ColorManager.primary,
                          size: FontSize.s35,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: FaIcon(
                          FontAwesomeIcons.solidEye,
                          color: ColorManager.primary,
                          size: FontSize.s35,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: FaIcon(
                          FontAwesomeIcons.nutritionix,
                          color: ColorManager.primary,
                          size: FontSize.s35,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: FaIcon(
                          FontAwesomeIcons.brain,
                          color: ColorManager.primary,
                          size: FontSize.s35,
                        ),
                        height: MediaQuery.of(context).size.width * 0.16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: FaIcon(
                          FontAwesomeIcons.baby,
                          color: ColorManager.primary,
                          size: FontSize.s35,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: FaIcon(
                          FontAwesomeIcons.xRay,
                          color: ColorManager.primary,
                          size: FontSize.s35,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
                        child: Icon(
                          Icons.more_horiz,
                          size: 30,
                          color: ColorManager.primary,
                        ),
                        height: MediaQuery.of(context).size.width * .16,
                        width: MediaQuery.of(context).size.width * .16,
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * .18,
                        child: Text(
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
              height: MediaQuery.of(context).size.height * .008,
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
                          color: ColorManager.primary),
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
                            fontSize: FontSize.s15,
                            color: ColorManager.primary),
                        textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(90.w, 30.h),
                        side: BorderSide(color: ColorManager.primary, width: 2),
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
                            fontSize: FontSize.s15,
                            color: ColorManager.primary),
                        textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(80.w, 30.h),
                        side: BorderSide(color: ColorManager.primary, width: 2),
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
                            fontSize: FontSize.s15,
                            color: ColorManager.primary),
                        textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(90.w, 30.h),
                        side: BorderSide(color: ColorManager.primary, width: 2),
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
    );
  }
}
