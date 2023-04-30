import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final formKey2 = GlobalKey<FormState>();

  final TextEditingController dateOfBirth = TextEditingController();

  final TextEditingController religion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDataCubit, ProfileDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileDataCubit cubit = ProfileDataCubit().get(context);
        dateOfBirth.text = ""; //set the initial value of text field
        //bloodType = bloodTypes.first;
        cubit.heightController.text = cubit.height.toStringAsFixed(1);
        cubit.weightController.text = cubit.weight.toStringAsFixed(1);
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
                        } else {}
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // religion
                  DefaultTextFormField(
                      controller: religion,
                      keyboardType: TextInputType.text,
                      label: AppStrings.religion,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  // blood type
                  DropdownButtonFormField<String>(
                    hint: Text('Blood type'),
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
                          if (!cubit.isMale) {
                            cubit.changeGender();
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s90,
                          height: AppSizeHeight.s80,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color: cubit.isMale
                                    ? ColorManager.primary
                                    : ColorManager.grey),
                            color: cubit.isMale
                                ? ColorManager.secondary
                                : ColorManager.lightGrey,
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
                          if (cubit.isMale) {
                            cubit.changeGender();
                          }
                        },
                        child: Container(
                          width: AppSizeWidth.s90,
                          height: AppSizeHeight.s80,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizeWidth.s10),
                            border: Border.all(
                                color: cubit.isMale
                                    ? ColorManager.grey
                                    : ColorManager.primary),
                            color: cubit.isMale
                                ? ColorManager.lightGrey
                                : ColorManager.secondary,
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
                          cubit.changeMaritalStatus(
                              status: MaritalStatus.single);
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
                          cubit.changeMaritalStatus(
                              status: MaritalStatus.married);
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
                          cubit.changeMaritalStatus(
                              status: MaritalStatus.divorced);
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
                          cubit.changeMaritalStatus(
                              status: MaritalStatus.widow);
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
                                keyboardType: TextInputType.number,
                                label: '',
                                validator: (value) {},
                                onFieldSubmitted: (value) {
                                  cubit.height = double.tryParse(
                                      cubit.heightController.text)!;
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
                                controller: cubit.weightController,
                                keyboardType: TextInputType.number,
                                label: '',
                                validator: (value) {},
                                onFieldSubmitted: (value) {
                                  cubit.weight = double.tryParse(
                                      cubit.weightController.text)!;
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
