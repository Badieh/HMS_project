import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_cubit.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';

class ProfileData3Screen extends StatelessWidget {
  ProfileData3Screen({Key? key}) : super(key: key);
  static final formKey3 = GlobalKey<FormState>();

  static final TextEditingController streetName = TextEditingController();

  static final TextEditingController appartmentNumber = TextEditingController();

  static final TextEditingController buildingNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDataCubit, ProfileDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileDataCubit cubit = ProfileDataCubit().get(context);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.secondary),
            borderRadius: BorderRadius.circular(AppPadding.p20),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Marital status
                  Text(
                    AppStrings.maritalStatus,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (cubit.maritalStatus != MaritalStatus.single) {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.single);
                          } else {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.none);
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s70,
                          height: AppSizeHeight.s25,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color:
                                    cubit.maritalStatus == MaritalStatus.single
                                        ? ColorManager.primary
                                        : ColorManager.lightGrey),
                            color: cubit.maritalStatus == MaritalStatus.single
                                ? ColorManager.secondary
                                : ColorManager.lightGrey,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.single,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: FontSize.s15),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (cubit.maritalStatus != MaritalStatus.married) {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.married);
                          } else {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.none);
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s70,
                          height: AppSizeHeight.s25,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color:
                                    cubit.maritalStatus == MaritalStatus.married
                                        ? ColorManager.primary
                                        : ColorManager.lightGrey),
                            color: cubit.maritalStatus == MaritalStatus.married
                                ? ColorManager.secondary
                                : ColorManager.lightGrey,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.married,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: FontSize.s15),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (cubit.maritalStatus != MaritalStatus.divorced) {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.divorced);
                          } else {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.none);
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s70,
                          height: AppSizeHeight.s25,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color: cubit.maritalStatus ==
                                        MaritalStatus.divorced
                                    ? ColorManager.primary
                                    : ColorManager.lightGrey),
                            color: cubit.maritalStatus == MaritalStatus.divorced
                                ? ColorManager.secondary
                                : ColorManager.lightGrey,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.divorced,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: FontSize.s15),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (cubit.maritalStatus != MaritalStatus.widow) {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.widow);
                          } else {
                            cubit.changeMaritalStatus(
                                status: MaritalStatus.none);
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s70,
                          height: AppSizeHeight.s25,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color:
                                    cubit.maritalStatus == MaritalStatus.widow
                                        ? ColorManager.primary
                                        : ColorManager.lightGrey),
                            color: cubit.maritalStatus == MaritalStatus.widow
                                ? ColorManager.secondary
                                : ColorManager.lightGrey,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.widowed,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: FontSize.s15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // nationality
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  Text(
                    AppStrings.nationality,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  CSCPicker(
                    defaultCountry: CscCountry.Egypt,
                    currentCountry: cubit.nationalitty ?? 'Country',
                    //countryDropdownLabel: 'Nationality',
                    showStates: false,
                    //defaultCountry: CscCountry.Egypt,

                    onCountryChanged: (value) {
                      cubit.changeNationality(value);
                      print(value.split(' ').last);
                    },
                    onStateChanged: (value) {},
                    onCityChanged: (value) {},
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // appartmentNumber
                  Text(
                    AppStrings.address,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  DefaultTextFormField(
                      controller: appartmentNumber,
                      keyboardType: TextInputType.number,
                      TextInputAction: TextInputAction.next,
                      label: AppStrings.appartmentNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // buildingNumber
                  DefaultTextFormField(
                      controller: buildingNumber,
                      keyboardType: TextInputType.number,
                      TextInputAction: TextInputAction.next,
                      label: AppStrings.buildingNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // streetName
                  DefaultTextFormField(
                      controller: streetName,
                      keyboardType: TextInputType.name,
                      TextInputAction: TextInputAction.next,
                      label: AppStrings.streetName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // city  / state / country
                  CSCPicker(
                    defaultCountry: CscCountry.Egypt,
                    currentCountry: cubit.addressCountry ?? 'Country',
                    currentCity: cubit.addressCity ?? 'City',
                    currentState: cubit.addressState ?? 'State',
                    //countryDropdownLabel: 'Count',
                    //defaultCountry: CscCountry.Egypt,

                    onCountryChanged: (value) {
                      cubit.changeAddressCountry(value);
                    },
                    onStateChanged: (value) {
                      if (value != null) {
                        cubit.changeAdressState(value);
                      }
                      print(value);
                    },
                    onCityChanged: (value) {
                      if (value != null) {
                        cubit.changeAdressCity(value);
                      }
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
