import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/resources/assets_manager.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/doctors.dart';
import 'package:hospital/presentation/screens/layout/layout_cubit/main_cubit.dart';
import 'package:hospital/presentation/screens/layout/layout_cubit/main_states.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;

class HomeLayoutScreen extends StatelessWidget {
  HomeLayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List appBars = [
      AppBar(
        toolbarHeight: AppSizeHeight.s70,
        title: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizeHeight.s50),
                color: Get.isDarkMode
                    ? ColorManager.lightBlack
                    : ColorManager.white,
              ),
              width: AppSizeWidth.s55,
              height: AppSizeHeight.s55,
              child: flutter_blurhash.BlurHash(
                image: AppConstants.adminStorage.read('patientPP'),
                hash: imageHashdummy,
                duration: const Duration(milliseconds: 500),
                imageFit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: AppSizeWidth.s18,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    AppStrings.welcomeMessage,
                    style: TextStyle(fontSize: FontSize.s20),
                  ),
                  AutoSizeText(
                    AppConstants.adminStorage.read('fullName'),
                    style: TextStyle(
                        fontSize: FontSize.s16,

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.notificationScreen);
            },
            icon: Icon(
              Icons.notifications_active_outlined,
              size: AppSizeHeight.s28,
            ),
          ),
          IconButton(
            onPressed: () async {
              final doctorsCubit = context.read<DoctorsCubit>();
              doctorsCubit.favourites = true ;
              await doctorsCubit.getDoctors();
              Get.toNamed(Routes.favouriteScreen);
            },
            icon: Icon(
              Icons.favorite_border,
              size: AppSizeHeight.s28,
            ),
          ),
        ],
      ),
      null,
      null,
      AppBar(
        title: const Text('Articles'),
      ),
      AppBar(
        toolbarHeight: AppSizeHeight.s70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: AppSizeHeight.s40,
              width: AppSizeWidth.s40,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                ImageAssets.hands1,
              ),
            ),
            SizedBox(
              width: AppSizeWidth.s18,
            ),
            Text(
              AppStrings.profile,
              style: TextStyle(fontSize: FontSize.s20),
            ),
          ],
        ),
      ),
    ];

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return SafeArea(
          child:  Scaffold(
            backgroundColor: context.theme.colorScheme.background,

            appBar: appBars[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              // backgroundColor: Colors.white,
              type: BottomNavigationBarType.shifting,
              items: cubit.items,
              selectedLabelStyle: TextStyle(fontSize: FontSize.s10),
              // selectedItemColor: Colors.blue,
              // unselectedItemColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: FontSize.s10),
              showUnselectedLabels: true,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.ChangeNavBarIndex(index);
              },
            ),
            body: cubit.tabs[cubit.currentIndex],
            floatingActionButton: cubit.currentIndex == 1
                ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorsScreen(),
                    ));
              },
              child: Icon(
                Icons.add,
                size: AppSizeHeight.s30,
              ),
            )
                : null,
          ),
        );
      },
    );
  }


}
