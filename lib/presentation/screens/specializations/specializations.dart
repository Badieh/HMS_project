import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:hospital/presentation/screens/specializations/cubit/specializations_cubit.dart';
import 'package:hospital/presentation/screens/specializations/cubit/specializations_states.dart';

class SpecializationsScreen extends StatelessWidget {
  const SpecializationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpecializationsCubit, SpecializationsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SpecializationsCubit cubit = SpecializationsCubit().get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Specializations'),
              actionsIconTheme: IconThemeData(size: FontSize.s30),
              actions: [

                     AnimatedIconButton(
                     duration: const Duration(milliseconds: 300),
                      onPressed: () {
                        cubit.changeViewType();
                      },
                      icons:  <AnimatedIconItem>[
                      AnimatedIconItem(
                      icon: Icon(Icons.grid_view,color: ColorManager.primary,),
                      ),
                      AnimatedIconItem(
                      icon: Icon(Icons.list,color :ColorManager.primary),
                      ),
                      ],


                  )

                    // cubit.viewType
                    //     ? Icon(Icons.grid_view)
                    //     : Icon(Icons.list))
              ],
            ),
            body: cubit.viewType ? showList() : showGrid(),
          );
        });
  }

  Widget showList() => ListView.separated(
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
              onTap: () {
                // Action to perform when the user taps the card
                Get.toNamed(Routes.doctors);
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

  Widget showGrid() => GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            radius: 30,
            borderRadius: BorderRadius.circular(80),
            onTap: () {
              Get.toNamed(Routes.doctors);

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
