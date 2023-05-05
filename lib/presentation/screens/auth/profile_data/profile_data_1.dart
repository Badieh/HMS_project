import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_cubit.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileData1Screen extends StatelessWidget {
  ProfileData1Screen({Key? key}) : super(key: key);
  static final formKey1 = GlobalKey<FormState>();
  static final TextEditingController firstName = TextEditingController();

  static final TextEditingController secondName = TextEditingController();

  static final TextEditingController thirdName = TextEditingController();

  static final TextEditingController lastName = TextEditingController();

  static final TextEditingController nationalIdCard = TextEditingController();

  static final TextEditingController phone = TextEditingController();

  final PhoneNumber number = PhoneNumber(
    isoCode: 'EG',
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileDataCubit, ProfileDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
              key: formKey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Profile Image
                  SizedBox(height: MediaQuery.of(context).size.height / 45),

                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                          backgroundColor: ColorManager.lightGrey,
                          radius: AppSizeWidth.s70,
                          child: Icon(
                            Icons.person,
                            size: AppSizeHeight.s100,
                            color: ColorManager.grey2,
                          )),
                      Container(
                        width: AppSizeWidth.s40,
                        height: AppSizeHeight.s40,
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius:
                              BorderRadius.circular(AppSizeHeight.s16),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: AppSizeWidth.s25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // firstName
                  DefaultTextFormField(
                      TextInputAction: TextInputAction.next,
                      controller: firstName,
                      keyboardType: TextInputType.name,
                      label: AppStrings.firstName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // secondName
                  DefaultTextFormField(
                      TextInputAction: TextInputAction.next,
                      controller: secondName,
                      keyboardType: TextInputType.name,
                      label: AppStrings.secondName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // thirdName
                  DefaultTextFormField(
                      TextInputAction: TextInputAction.next,
                      controller: thirdName,
                      keyboardType: TextInputType.name,
                      label: AppStrings.thirdName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // lastName
                  DefaultTextFormField(
                      controller: lastName,
                      TextInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      label: AppStrings.lastName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // nationalIdCard
                  DefaultTextFormField(
                      controller: nationalIdCard,
                      keyboardType: TextInputType.number,
                      TextInputAction: TextInputAction.next,
                      label: AppStrings.nationalIdCard,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.validator;
                        }
                      },
                      onFieldSubmitted: (value) {}),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // phone
                  InternationalPhoneNumberInput(
                    spaceBetweenSelectorAndTextField: AppSizeWidth.s0,
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: number,
                    textFieldController: phone,
                    formatInput: true,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    onSaved: (PhoneNumber number) {
                      phone.text = number.toString();
                      print('On Saved: $number');
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
