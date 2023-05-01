import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class ProfileData4Screen extends StatefulWidget {
  const ProfileData4Screen({Key? key}) : super(key: key);

  @override
  State<ProfileData4Screen> createState() => _ProfileData4ScreenState();
}

class _ProfileData4ScreenState extends State<ProfileData4Screen> {
  static final formKey4 = GlobalKey<FormState>();

  late String birthCountry;

  String? birthState;

  String? birthCity;

  static final TextEditingController job = TextEditingController();

  static final TextEditingController jobBuildingNumber =
      TextEditingController();

  static final TextEditingController jobStreetName = TextEditingController();

  late String jobCountry;

  String? jobState;

  String? jobCity;

  @override
  Widget build(BuildContext context) {
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
                // countryDropdownLabel: 'Nationality',
                // showStates: false,
                //defaultCountry: CscCountry.Egypt,

                onCountryChanged: (value) {
                  setState(() {
                    birthCountry = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    birthState = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    birthCity = value;
                  });
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
                  label: AppStrings.job,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobBuildingNumber
              DefaultTextFormField(
                  controller: jobBuildingNumber,
                  keyboardType: TextInputType.number,
                  label: AppStrings.jobBuildingNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobStreetName
              DefaultTextFormField(
                  controller: jobStreetName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.jobStreetName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobCity /jobState  /jobCountry
              CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    jobCountry = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    jobState = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    jobCity = value;
                  });
                },
              ),

              SizedBox(height: MediaQuery.of(context).size.height / 45),
            ],
          ),
        ),
      ),
    );
  }
}
