import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_cubit.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';
import 'package:intl/intl.dart';

class ProfileData2Screen extends StatelessWidget {
  ProfileData2Screen({Key? key}) : super(key: key);
  static final formKey2 = GlobalKey<FormState>();

  static final TextEditingController dateOfBirth = TextEditingController();

  static final TextEditingController religion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDataCubit, ProfileDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileDataCubit cubit = ProfileDataCubit().get(context);
        //bloodType = bloodTypes.first;
        // cubit.heightController.text = cubit.height.toStringAsFixed(1);
        // cubit.weightController.text = cubit.weight.toStringAsFixed(1);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.secondary),
            borderRadius: BorderRadius.circular(AppPadding.p20),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // dateOfBirth
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  DefaultTextFormField(
                      controller: dateOfBirth,
                      keyboardType: TextInputType.none,
                      TextInputAction: TextInputAction.next,
                      label: AppStrings.dateOfBirth,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now());

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16

                          dateOfBirth.text =
                              formattedDate; //set output date to TextField value.
                          cubit.changeDate(formattedDate);

                        } else {}
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // religion
                  // DefaultTextFormField(
                  //     controller: religion,
                  //     keyboardType: TextInputType.text,
                  //     label: AppStrings.religion,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return AppStrings.validator;
                  //       }
                  //     },
                  //     onFieldSubmitted: (value) {}),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      fillColor: Get.isDarkMode? ColorManager.lightBlack :ColorManager.lightGrey,

                    ),
                    hint:  Text('Religion',style :TextStyle(color: Get.isDarkMode? ColorManager.secondary :ColorManager.grey)),

                    value: cubit.religion,

                    isExpanded: true,
                    elevation: 16,
                    //style: TextStyle(color: ColorManager.primary),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      cubit.changeReligion(value: value!);
                    },
                    items: cubit.religions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // blood type
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      fillColor: Get.isDarkMode? ColorManager.lightBlack :ColorManager.lightGrey,

                    ),
                    hint: Text('Blood type',style :TextStyle(color: Get.isDarkMode? ColorManager.secondary :ColorManager.grey)),
                    value: cubit.bloodType,
                    icon: const Icon(Icons.bloodtype_outlined),
                    isExpanded: true,
                    elevation: 16,
                    //style: TextStyle(color: ColorManager.primary),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      cubit.changeBloodType(type: value!);
                    },
                    items: cubit.bloodTypes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // gender
                  Text(
                    AppStrings.gender,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // send true in case of male
                          // send null in case of noothing choosen
                          if (cubit.isGender == false) {
                            cubit.changeGender(true);
                          } else if (!cubit.isMale!) {
                            cubit.changeGender(true);
                          } else {
                            cubit.changeGender(null);
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s90,
                          height: AppSizeHeight.s80,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color: (cubit.isGender && cubit.isMale!)
                                    ? ColorManager.primary
                                    : Get.isDarkMode ? ColorManager.lightBlack: ColorManager.grey),
                            color: (cubit.isGender && cubit.isMale!)
                                ? ColorManager.primary
                                : Get.isDarkMode ? ColorManager.lightBlack:ColorManager.lightGrey,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  Icons.boy,
                                  size: AppSizeHeight.s60,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  AppStrings.male,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // send false in case of male
                          // send true in case of female
                          // send null in case of noothing choosen
                          if (cubit.isGender == false) {
                            cubit.changeGender(false);
                          } else if (cubit.isMale!) {
                            cubit.changeGender(false);
                          } else {
                            cubit.changeGender(null);
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s90,
                          height: AppSizeHeight.s80,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color: (cubit.isGender && !cubit.isMale!)
                                    ? ColorManager.primary
                                    : ColorManager.grey),
                            color: (cubit.isGender && !cubit.isMale!)
                                ? ColorManager.pink
                                : Get.isDarkMode ? ColorManager.lightBlack:ColorManager.lightGrey,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  Icons.girl,
                                  size: AppSizeHeight.s60,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  AppStrings.female,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // height
                  Row(
                    children: [
                      Text(
                        AppStrings.height,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: FontSize.s18),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            width: AppSizeWidth.s65,
                            height: AppSizeHeight.s35,
                            child: DefaultTextFormField(
                                textAlign: TextAlign.center,

                                controller: cubit.heightController,
                                TextInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                label: '',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  if (double.tryParse(
                                          cubit.heightController.text)! <
                                      250) {
                                    cubit.height = double.tryParse(
                                        cubit.heightController.text)!;
                                  } else {
                                    cubit.height = 250;
                                  }
                                }),
                          ),
                          Text(
                            AppStrings.cm,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Slider(
                    inactiveColor: Get.isDarkMode ? ColorManager.grey : ColorManager.darkGrey,
                    min: 0,
                    max: 250,
                    value: cubit.height,
                    onChanged: (value) {
                      cubit.changeHeight(value);
                    },
                  ),

                  // weight
                  Row(
                    children: [
                      Text(
                        AppStrings.weight,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: FontSize.s18),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            width: AppSizeWidth.s65,
                            height: AppSizeHeight.s35,
                            child: DefaultTextFormField(
                                textAlign: TextAlign.center,
                                TextInputAction: TextInputAction.next,
                                controller: cubit.weightController,
                                keyboardType: TextInputType.number,
                                label: '',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                },
                                onFieldSubmitted: (value) {
                                  if (double.tryParse(
                                          cubit.weightController.text)! <
                                      250) {
                                    cubit.weight = double.tryParse(
                                        cubit.weightController.text)!;
                                  } else {
                                    cubit.weight = 250;
                                  }
                                }),
                          ),
                          Text(
                            AppStrings.kg,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Slider(
                    inactiveColor: Get.isDarkMode ? ColorManager.grey : ColorManager.darkGrey,

                    min: 1,
                    max: 250,
                    value: cubit.weight,
                    onChanged: (value) {
                      cubit.changeWeight(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
