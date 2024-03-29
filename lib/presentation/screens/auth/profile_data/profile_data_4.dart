import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_states.dart';

class ProfileData4Screen extends StatelessWidget {
  const ProfileData4Screen({Key? key}) : super(key: key);
  static final formKey4 = GlobalKey<FormState>();

  static final TextEditingController job = TextEditingController();

  static final TextEditingController jobBuildingNumber =
      TextEditingController();

  static final TextEditingController jobStreetName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.secondary),
            borderRadius: BorderRadius.circular(AppPadding.p20),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // birthPlaceCity / birthPlaceState  /birthPlaceCountry
                  SizedBox(height: MediaQuery.of(context).size.height / 70),

                  Text(
                    AppStrings.birthAddress,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  CSCPicker(
                    currentCountry: AuthCubit.birthCountry ?? 'Birth Country',
                    currentCity: AuthCubit.birthCity ?? 'Birth City',
                    currentState: AuthCubit.birthState ?? 'Birth State',
                    dropdownDecoration: BoxDecoration(
                        color: Get.isDarkMode ? ColorManager.lightBlack : ColorManager.grey
                    ),
                    disabledDropdownDecoration: BoxDecoration(
                    color: Get.isDarkMode ? ColorManager.lightBlack : ColorManager.grey,

                  ),

                    // countryDropdownLabel: 'Nationality',
                    // showStates: false,
                    //defaultCountry: CscCountry.Egypt,

                    onCountryChanged: (value) {
                      cubit.changeBirthCountry(value);
                    },
                    onStateChanged: (value) {
                      if (value != null) {
                        cubit.changeBirthState(value);
                      }
                    },
                    onCityChanged: (value) {
                      if (value != null) {
                        cubit.changeBirthCity(value);
                      }
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // job
                  Text(
                    AppStrings.jobDetails,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  DefaultTextFormField(
                      controller: job,
                      keyboardType: TextInputType.text,
                      TextInputAction: TextInputAction.next,
                      label: AppStrings.job,
                      validator: (value) {
                        // if (value == null || value.isEmpty) {
                        //   return AppStrings.validator;
                        // }
                      },
                      onFieldSubmitted: (value) {
                        cubit.changeJob(value);
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // // jobBuildingNumber
                  // DefaultTextFormField(
                  //     controller: jobBuildingNumber,
                  //     keyboardType: TextInputType.number,
                  //     TextInputAction: TextInputAction.next,
                  //     label: AppStrings.jobBuildingNumber,
                  //     validator: (value) {
                  //       // if (value == null || value.isEmpty) {
                  //       //   return AppStrings.validator;
                  //       // }
                  //     },
                  //     onFieldSubmitted: (value) {
                  //       cubit.changejobBuildingNumber(value);
                  //     }),
                  // SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // // jobStreetName
                  // DefaultTextFormField(
                  //     controller: jobStreetName,
                  //     keyboardType: TextInputType.name,
                  //     label: AppStrings.jobStreetName,
                  //     validator: (value) {
                  //       // if (value == null || value.isEmpty) {
                  //       //   return AppStrings.validator;
                  //       // }
                  //     },
                  //     onFieldSubmitted: (value) {
                  //       cubit.changejobjobStreetName(value);
                  //     }),
                  // SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // jobCity /jobState  /jobCountry
                  CSCPicker(
                    currentCountry: AuthCubit.jobCountry ?? 'Job Country',
                    currentCity: AuthCubit.jobCity ?? 'Job City',
                    currentState: AuthCubit.jobState ?? 'Job State',
                    dropdownDecoration: BoxDecoration(
                        color: Get.isDarkMode ? ColorManager.lightBlack : ColorManager.grey
                    ),
                    disabledDropdownDecoration: BoxDecoration(
                  color: Get.isDarkMode ? ColorManager.lightBlack : ColorManager.grey,

                  ),

                    onCountryChanged: (value) {
                      cubit.changeJobCountry(value);
                    },
                    onStateChanged: (value) {
                      cubit.changeJobState(value!);
                    },
                    onCityChanged: (value) {
                      cubit.changeJobCity(value!);
                    },
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
