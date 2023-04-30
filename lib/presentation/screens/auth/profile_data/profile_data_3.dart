import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class ProfileData3Screen extends StatefulWidget {
  ProfileData3Screen({Key? key}) : super(key: key);

  @override
  State<ProfileData3Screen> createState() => _ProfileData3ScreenState();
}

class _ProfileData3ScreenState extends State<ProfileData3Screen> {
  final formKey3 = GlobalKey<FormState>();

  late String nationalitty;

  final TextEditingController streetName = TextEditingController();

  final TextEditingController appartmentNumber = TextEditingController();

  final TextEditingController buildingNumber = TextEditingController();

  late String addressCountry;

  String? addressState;

  String? addressCity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.secondary),
        borderRadius: BorderRadius.circular(AppPadding.p20),
      ),
      child: Form(
        key: formKey3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              //countryDropdownLabel: 'Nationality',
              showStates: false,
              //defaultCountry: CscCountry.Egypt,

              onCountryChanged: (value) {
                setState(() {
                  nationalitty = value;
                });
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
              //countryDropdownLabel: 'Count',
              //defaultCountry: CscCountry.Egypt,

              onCountryChanged: (value) {
                setState(() {
                  addressCountry = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  addressState = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  addressCity = value;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
          ],
        ),
      ),
    );
  }
}
