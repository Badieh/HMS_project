import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                  [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                       "assets/images/hands1.png",
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.s20),
                    ),

                  ],),
                  Icon(Icons.more_horiz_outlined)
                ],
              ),
              SizedBox(
                height: AppSizeHeight.s8,
              ),
              // profile data =======
              Column(

                children: [
                  Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/profile.png",
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(60)),
                  ),
                  SizedBox(
                    height: AppSizeHeight.s8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Bishoy Shehata",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize:  FontSize.s18),
                      ),
                      Text(
                        "Elmasry01285@gmail.com",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize:  FontSize.s14),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorManager.grey2,
                    thickness: 1,
                    height: 60,
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. person_2_outlined,size: AppSizeHeight.s25,color: ColorManager.primary,),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle( fontSize: FontSize.s18),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. notifications_active_outlined,size: AppSizeHeight.s25,color: ColorManager.primary,),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Notification",
                        style: TextStyle( fontSize: FontSize.s18),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. payment,size: AppSizeHeight.s25,color: ColorManager.primary,),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Payment",
                        style: TextStyle( fontSize: FontSize.s18),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. security,size: AppSizeHeight.s25,color: ColorManager.primary,),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Security",
                        style: TextStyle( fontSize: FontSize.s18),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. language,size: AppSizeHeight.s25,color: ColorManager.primary,),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Language",
                        style: TextStyle( fontSize: FontSize.s18),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. dark_mode_outlined,size: AppSizeHeight.s25,color: ColorManager.primary,),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Dark Mode",
                        style: TextStyle( fontSize: FontSize.s18),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:
                    [
                      Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons. logout,size: AppSizeHeight.s25,color: ColorManager.error),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle( fontSize: FontSize.s18,color: ColorManager.error),
                      ),

                    ],),
                  Icon(Icons.arrow_forward_ios_outlined,size: AppSizeWidth.s18,)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
