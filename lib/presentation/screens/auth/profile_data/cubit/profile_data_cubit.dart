import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';

class ProfileDataCubit extends Cubit<ProfileDataStates> {
  ProfileDataCubit() : super(ProfileDtateInitialState());

  ProfileDataCubit get(context) => BlocProvider.of(context);

  String? date;
  void changeDate(String value) {
    date = value;
    emit(ChangeDateState());
  }

  final List<String> religions = <String>[
    'Muslim',
    'Christian',
    'Jewish',
  ];
  String? religion;
  void changeReligion({required String value}) {
    religion = value;
    emit(ChangeReligionState());
  }

  final List<String> bloodTypes = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  String? bloodType;
  void changeBloodType({required String type}) {
    bloodType = type;
    emit(ChangeBloodTypeState());
  }

  bool isGender = false;
  bool? isMale;
  void changeGender(bool? value) {
    isMale = value;

    if (value != null) {
      isGender = true;
    } else {
      isGender = false;
    }
    emit(ChangeGenderState());
  }

  MaritalStatus maritalStatus = MaritalStatus.none;

  void changeMaritalStatus({required MaritalStatus status}) {
    maritalStatus = status;
    emit(ChangeMaritalStatusState());
  }

  final TextEditingController heightController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  double height = 170.0;
  void changeHeight(double value) {
    height = value;
    heightController.text = value.toStringAsFixed(1);
    emit(ChangeHeightState());
  }

  double weight = 80;
  void changeWeight(double value) {
    weight = value;
    weightController.text = value.toStringAsFixed(1);

    emit(ChangeWeightState());
  }

  String? nationalitty;

  void changeNationality(String value) {
    nationalitty = value;
    emit(ChangeNationalityState());
  }

  String? addressCountry = 'Egypt';

  String? addressState;

  String? addressCity;

  void changeAddressCountry(String value) {
    addressCountry = value;
    emit(ChangeAddressCountryState());
  }

  void changeAdressCity(String value) {
    addressCity = value;
    emit(ChangeAddressCityState());
  }

  void changeAdressState(String value) {
    addressState = value;
    emit(ChangeAddressStateState());
  }

  String? birthCountry;

  String? birthState;

  String? birthCity;

  void changeBirthCountry(String value) {
    birthCountry = value;
    emit(ChangeBirthCountryState());
  }

  void changeBirthCity(String value) {
    birthCity = value;
    emit(ChangeBirthCityState());
  }

  void changeBirthState(String value) {
    birthState = value;
    emit(ChangeBirthStateState());
  }

  String? jobCountry;

  String? jobState;

  String? jobCity;

  void changeJobCountry(String value) {
    birthCountry = value;
    emit(ChangeJobCountryState());
  }

  void changeJobCity(String value) {
    birthCity = value;
    emit(ChangeJobCityState());
  }

  void changeJobState(String value) {
    birthState = value;
    emit(ChangeJobStateState());
  }

  final pageController = PageController(viewportFraction: 1, keepPage: true);
  double currentPage = 0;
  bool endReached = false;
  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
    currentPage = pageController.page! + 1;
    if (currentPage == 3) {
      endReached = true;
    }
    print(currentPage);
    emit(ChangePage());
  }

  void previousPage() {
    pageController.previousPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
    currentPage = pageController.page! + 1;

    print(currentPage);
    emit(ChangePage());
  }
}

enum MaritalStatus {
  none,
  single,
  married,
  divorced,
  widow,
}
