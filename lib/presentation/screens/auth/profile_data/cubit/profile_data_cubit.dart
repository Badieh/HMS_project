import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfileDataCubit extends Cubit<ProfileDataStates> {
  ProfileDataCubit() : super(ProfileDtateInitialState());

  ProfileDataCubit get(context) => BlocProvider.of(context);

  String? firstName;
  String? secondName;
  String? thirdName;
  String? lastName;
  String? phone;
  String? nationalId;
  void changeFirstName(String value) {
    secondName = value;
    emit(ChangeFirstNameState());
  }

  void changeSecondName(String value) {
    firstName = value;
    emit(ChangeSecondNameState());
  }

  void changeThirdName(String value) {
    thirdName = value;
    emit(ChangeThirdNameState());
  }

  void changeLastName(String value) {
    lastName = value;
    emit(ChangeLastNameState());
  }

  void changeNationalId(String value) {
    nationalId = value;
    emit(ChangeNationalIdState());
  }

  void changePhone(String? value) {
    phone = value;
    emit(ChangePhoneState());
  }

  String? dateofBirth;
  void changeDate(String value) {
    dateofBirth = value;
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

  String? appartmentNumber;
  String? buildingNumber;
  String? streetName;
  String? addressCountry = 'Egypt';

  String? addressState;

  String? addressCity;

  void changeAppartmentNumber(String value) {
    appartmentNumber = value;
    emit(ChangeAppartmentNumber());
  }

  void changeBuildingNumber(String value) {
    buildingNumber = value;
    emit(ChangeBuildingNumber());
  }

  void changeStreetName(String value) {
    streetName = value;
    emit(ChangeStreetName());
  }

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
  void changePage(int index) {
    currentPage = index.toDouble();
    if (currentPage == 3) {
      endReached = true;
    } else {
      endReached = false;
    }
    print(currentPage);

    emit(ChangePage());
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
    // currentPage = pageController.page! + 1;
    // if (currentPage == 3) {
    //   endReached = true;
    // }
    print(currentPage);
    emit(ChangePage());
  }

  void previousPage() {
    pageController.previousPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
    // currentPage = pageController.page! + 1;

    print(currentPage);
    emit(ChangePage());
  }

  Future<bool> submit({
    required BuildContext context,
  }) async {
    if (firstName == null ||
        secondName == null ||
        thirdName == null ||
        lastName == null ||
        nationalId == null ||
        phone == null ||
        nationalitty == null ||
        appartmentNumber == null ||
        buildingNumber == null ||
        streetName == null ||
        addressCountry == null ||
        dateofBirth == null) {
      //quick alert Please Complete your Mandatory Data
      QuickAlert.show(
        backgroundColor: Get.isDarkMode ? ColorManager.lightBlack:ColorManager.lightPrimary,
        context: context,
        barrierDismissible: false,
        type: QuickAlertType.warning,titleColor: Get.isDarkMode ? ColorManager.white : ColorManager.black,
        confirmBtnColor: ColorManager.primary,
        width: MediaQuery.of(context).size.width,
        widget: const Text(AppStrings.mandatoryData),
        animType: QuickAlertAnimType.slideInDown,
      );
      print(firstName);
      print(secondName);
      print(thirdName);
      print('last name $lastName');
      print(nationalId);
      print(phone);
      print(dateofBirth);
      print('ap $appartmentNumber');
      print(buildingNumber);
      print(streetName);
      print(addressCountry);
      return false;
    } else if (addressState == null) {
      // quick Alert address state is incomplete
      QuickAlert.show(
        backgroundColor: ColorManager.lightPrimary,
        context: context,
        barrierDismissible: false,
        type: QuickAlertType.warning,
        width: MediaQuery.of(context).size.width,
        widget: const Text(AppStrings.stateEmpty),
        animType: QuickAlertAnimType.slideInDown,
      );
      return false;
    } else if (!isGender) {
      // quick Alert Gender is incomplete
      QuickAlert.show(
        backgroundColor: ColorManager.lightPrimary,
        context: context,
        barrierDismissible: false,
        type: QuickAlertType.warning,
        width: MediaQuery.of(context).size.width,
        widget: const Text('Please Choose your Gender'),
        animType: QuickAlertAnimType.slideInDown,
      );
      return false;
    } else {
      emit(SubmitLoadingState());

      try {
        //   var response =
        //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
        //     'country': AppConstants.country,
        //     'category': AppConstants.category,
        //     'apiKey': AppConstants.articlesApiKey,
        //   });
        //   //print(response.data['articles'][1]);
        //   topDoctorsDetails = List.from(response.data['topDoctorsDetails'])
        //       .map((e) => TopDoctorModel.fromJson(e))
        //       .toList();

        // print(articles[1]);

        emit(SubmitSuccefulState());
        return true;
      } catch (error) {
        print(error.toString());
        emit(SubmitErrorState(error.toString()));
        QuickAlert.show(
          backgroundColor: ColorManager.lightPrimary,
          context: context,
          barrierDismissible: false,
          type: QuickAlertType.error,
          width: MediaQuery.of(context).size.width,
          title: 'Error',
          text: 'Something went wrong , contact Adminstrator',
          animType: QuickAlertAnimType.slideInDown,
        );
        return false;
      }
    }
  }
}

enum MaritalStatus {
  none,
  single,
  married,
  divorced,
  widow,
}
