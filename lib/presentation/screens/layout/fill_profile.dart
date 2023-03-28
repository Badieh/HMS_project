import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class FillProfile extends StatelessWidget {
  FillProfile({Key? key}) : super(key: key);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController thirdName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController nationalIdCard = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController religion = TextEditingController();
  final TextEditingController gender = TextEditingController();
//  final TextEditingController maritalStatus = TextEditingController();
  final TextEditingController nationality = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController fullAddress = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController streetName = TextEditingController();
  final TextEditingController appartmentNumber = TextEditingController();
  final TextEditingController buildingNumber = TextEditingController();
  final TextEditingController job = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fill your profile"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p8, horizontal: AppPadding.p20),
            child: Column(
              children: [
                // Profile Image
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                        backgroundColor: ColorManager.lightGrey,
                        radius: AppSizeWidth.s80,
                        child: Icon(
                          Icons.person,
                          size: AppSizeHeight.s120,
                          color: ColorManager.grey2,
                        )),
                    Container(
                      width: AppSizeWidth.s40,
                      height: AppSizeHeight.s40,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(AppSizeHeight.s16),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: AppSizeWidth.s25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 45),

                // firstName
                DefaultTextFormField(
                    controller: firstName,
                    keyboardType: TextInputType.name,
                    label: AppStrings.firstName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),

                // secondName
                DefaultTextFormField(
                    controller: secondName,
                    keyboardType: TextInputType.name,
                    label: AppStrings.secondName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),

                // thirdName
                DefaultTextFormField(
                    controller: thirdName,
                    keyboardType: TextInputType.name,
                    label: AppStrings.thirdName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),

                // lastName
                DefaultTextFormField(
                    controller: lastName,
                    keyboardType: TextInputType.name,
                    label: AppStrings.lastName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),

                // nationalIdCard
                DefaultTextFormField(
                    controller: nationalIdCard,
                    keyboardType: TextInputType.number,
                    label: AppStrings.nationalIdCard,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 45),

                // phone
                DefaultTextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    label: AppStrings.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),

                // dateOfBirth
                DefaultTextFormField(
                    controller: dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    label: AppStrings.dateOfBirth,
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

                // dateOfBirth
                DefaultTextFormField(
                    controller: dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    label: AppStrings.dateOfBirth,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),
                // dateOfBirth
                DefaultTextFormField(
                    controller: dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    label: AppStrings.dateOfBirth,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),
                // dateOfBirth
                DefaultTextFormField(
                    controller: dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    label: AppStrings.dateOfBirth,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.validator;
                      }
                    },
                    onFieldSubmitted: (value) {}),
                SizedBox(height: MediaQuery.of(context).size.height / 45),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
