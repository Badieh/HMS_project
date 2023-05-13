import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_states.dart';
import 'package:hospital/presentation/screens/doctors/doctors.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';

class SpecializationsScreen extends StatelessWidget {
  const SpecializationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsCubit, DoctorsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorsCubit cubit = DoctorsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              actionsIconTheme: IconThemeData(size: FontSize.s30),
              title: const Text(AppStrings.specializations),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  //Get.offAllNamed(Routes.homeLayoutScreen);
                },
                icon: const Icon(Icons.arrow_back_outlined),
              ),
              actions: [
                AnimatedIconButton(
                  duration: const Duration(milliseconds: 300),
                  onPressed: () {
                    cubit.changeViewType();
                  },
                  icons: <AnimatedIconItem>[
                    AnimatedIconItem(
                      icon: Icon(
                        Icons.grid_view,
                        color: ColorManager.primary,
                      ),
                    ),
                    AnimatedIconItem(
                      icon: Icon(Icons.list, color: ColorManager.primary),
                    ),
                  ],
                )

                // cubit.viewType
                //     ? Icon(Icons.grid_view)
                //     : Icon(Icons.list))
              ],
            ),
            body: cubit.viewType ? showList(cubit) : showGrid(cubit),
          );
        });
  }

  Widget showList(DoctorsCubit cubit) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
          child: Card(
            child: ListTile(
              iconColor: ColorManager.primary,
              leading: AppConstants.specializationIcons[index],
              title: Text(AppConstants.specializations[index]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () async {
                cubit.specialization = index;
                await cubit.getDoctors();
                Get.offAllNamed(Routes.doctors);
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        );
      },
      itemCount: AppConstants.specializations.length);

  Widget showGrid(cubit) => GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            radius: 30,
            borderRadius: BorderRadius.circular(80),
            onTap: () async {
              cubit.specialization = index;
              await cubit.getDoctors();
              Get.offAllNamed(Routes.doctors);

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DoctorsScreen(),
              //     ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width * .16,
                  width: MediaQuery.of(context).size.width * .16,
                  decoration: BoxDecoration(
                    color: ColorManager.lightPrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AppConstants.specializationIcons[index],
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * .005,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width * .28,
                  child: Text(
                    AppConstants.specializations[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
        physics: const BouncingScrollPhysics(),
        itemCount: AppConstants.specializations.length,
      );
}
