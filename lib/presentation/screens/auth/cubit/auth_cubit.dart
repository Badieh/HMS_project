import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/error_model.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/models/user_model.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_states.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_1.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_2.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_3.dart';
import 'package:hospital/presentation/screens/auth/profile_data/profile_data_4.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  static String? firstName;
  static String? secondName;
  static String? thirdName;
  static String? lastName;
  static String? phone;
  static String? nationalId;
  void changeFirstName(String value) {
    firstName = value;
    emit(ChangeFirstNameState());
  }

  void changeSecondName(String value) {
    secondName = value;
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
    'Other'
  ];

  static int? religionIndex;
  String? religion;
  void changeReligion({required String value}) {
    religion = value;
    religionIndex = religions.indexOf(value);
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
  static int? bloodTypeIndex;
  void changeBloodType({required String type}) {
    bloodType = type;
    bloodTypeIndex = bloodTypes.indexOf(type);
    emit(ChangeBloodTypeState());
  }

  bool isGender = false; // to specify if the gender is selsected
  bool? isMale; // Gneder type
  int gender = -1; // the value sent to API
  void changeGender(bool? value) {
    isMale = value;

    if (value != null) {
      isGender = true;
    } else {
      isGender = false;
    }
    if (isMale == true) {
      gender = 0;
    } else if (isMale == false) {
      gender == 1;
    }
    emit(ChangeGenderState());
  }

  MaritalStatus maritalStatus = MaritalStatus.none;
  int getMaritalStatusIndex() {
    switch (maritalStatus) {
      case MaritalStatus.none:
        return 0;
      case MaritalStatus.single:
        return 1;
      case MaritalStatus.married:
        return 2;

      case MaritalStatus.divorced:
        return 3;
      case MaritalStatus.widow:
        return 4;
    }
  }

  void changeMaritalStatus({required MaritalStatus status}) {
    maritalStatus = status;
    emit(ChangeMaritalStatusState());
  }

  final TextEditingController heightController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  static double height = 170.0;
  void changeHeight(double value) {
    height = value;
    heightController.text = value.toStringAsFixed(1);
    emit(ChangeHeightState());
  }

  static double weight = 80;
  void changeWeight(double value) {
    weight = value;
    weightController.text = value.toStringAsFixed(1);

    emit(ChangeWeightState());
  }

  String? nationalitty;
  static int? nationalityIndex;
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

  static String? birthCountry;

  static String? birthState;

  static String? birthCity;

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

  static String? job;
  static String? jobBuildingNumber;
  static String? jobStreetName;
  static String? jobCountry;

  static String? jobState;

  static String? jobCity;
  void changeJob(String value) {
    job = value;
    emit(ChangeJobState());
  }

  void changejobBuildingNumber(String value) {
    jobBuildingNumber = value;
    emit(ChangeJobBuildingState());
  }

  void changejobjobStreetName(String value) {
    jobStreetName = value;
    emit(ChangeJobStateState());
  }

  void changeJobCountry(String value) {
    jobStreetName = value;
    emit(ChangeJobCountryState());
  }

  void changeJobCity(String value) {
    jobCity = value;
    emit(ChangeJobCityState());
  }

  void changeJobState(String value) {
    jobState = value;
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

  UserType userType = UserType.patient;
  void changeUserType(UserType type) {
    userType = type;
    emit(ChangeUserTypeState());
  }

  bool isPassword = true;
  void changePasswordAppearance() {
    isPassword = !isPassword;
    emit(ChangePasswordAppearanceState());
  }

  ErrorModel? errorModel;
  RegisterUserModel? registerUserModel;
  LoginUserModel? loginUserModel;

  Future<void> register(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());
    print('email : $email');
    print('password : $password');
    print('role : ${userType.name}');
    AppConstants.adminStorage.write('role', userType.name);

    try {
      // get data from API
      var response =
          await DioHelper.postData(url: AppConstants.registerPath, data: {
        'email': email,
        'password': password,
        'role': userType.name,
      });
      print('Got Data from Api');
      // Saving data in UserModel
      registerUserModel = RegisterUserModel.fromJson(response.data);
      print('User is :${registerUserModel?.user.email}');
      print('Access token :${registerUserModel?.tokens.accessToken.token}');
      print('Refresh token ${registerUserModel?.tokens.refreshToken.token}');
      // Saving Access token and Refresh token for future use

      AppConstants.adminStorage.write('userId', registerUserModel?.user.userId);
      AppConstants.adminStorage
          .write('accessToken', registerUserModel?.tokens.accessToken.token);
      AppConstants.adminStorage
          .write('refreshToken', registerUserModel?.tokens.refreshToken.token);
      AppConstants.adminStorage.write('email', registerUserModel?.user.email);

      print(AppConstants.adminStorage.read('accessToken'));
      print(AppConstants.adminStorage.read('refreshToken'));
      print(AppConstants.adminStorage.read('userId'));
      // await CacheHelper.saveData(
      //     key: 'accessToken',
      //     value: registerUserModel?.tokens.accessToken.token);
      // AppConstants.accessToken = await CacheHelper.getData(key: 'accessToken');
      // await CacheHelper.saveData(
      //     key: 'refreshsToken',
      //     value: registerUserModel?.tokens.refreshToken.token);
      // AppConstants.refreshToken =
      //     await CacheHelper.getData(key: 'refreshsToken');
      // await CacheHelper.saveData(
      //     key: 'userId', value: registerUserModel?.user.userId);
      // AppConstants.userId = await CacheHelper.getData(key: 'userId');
      // print('saved user id :${AppConstants.userId}');
      // print('saved refreshToken :${AppConstants.refreshToken}');
      // print('saved accessToken :${AppConstants.accessToken}');

      emit(RegisterSuccessfulState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
        // print('Error Stack :${errorModel?.stack}');
      }

      emit(RegisterErrorState(error.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    print('email : $email');
    print('password : $password');

    try {
      // get data from API
      var response =
          await DioHelper.postData(url: AppConstants.loginPath, data: {
        'email': email,
        'password': password,
      });
      print('Got Data from Api');
      // Saving data in UserModel
      loginUserModel = LoginUserModel.fromJson(response.data);
      print('User is :${loginUserModel?.user.email}');
      print('UserID is :${loginUserModel?.user.userId}');
      print('Access token :${loginUserModel?.tokens.accessToken.token}');
      print('Refresh token ${loginUserModel?.tokens.refreshToken.token}');
      // Saving Access token and Refresh token for future use
      AppConstants.adminStorage
          .write('accessToken', loginUserModel?.tokens.accessToken.token);
      AppConstants.adminStorage
          .write('refreshToken', loginUserModel?.tokens.refreshToken.token);
      AppConstants.adminStorage.write('userId', loginUserModel?.user.userId);
      AppConstants.adminStorage.write('email', loginUserModel?.user.email);

      print(AppConstants.adminStorage.read('accessToken'));
      print(AppConstants.adminStorage.read('refreshToken'));
      print(AppConstants.adminStorage.read('userId'));

      await getPatient(userId: loginUserModel?.user.userId);
      emit(LoginSuccessfulState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
        // print('Error Stack :${errorModel?.stack}');
      }

      emit(LoginErrorState(error.toString()));
    }
  }

  PatientModel? patientModel;
  Future<void> submitProfileData({
    required BuildContext context,
  }) async {
    if (ProfileData1Screen.firstName.text.isEmpty ||
        ProfileData1Screen.secondName.text.isEmpty ||
        ProfileData1Screen.thirdName.text.isEmpty ||
        ProfileData1Screen.lastName.text.isEmpty ||
        ProfileData1Screen.nationalIdCard.text.isEmpty ||
        ProfileData1Screen.phoneController.text.isEmpty ||
        nationalitty == null ||
        ProfileData3Screen.appartmentNumber.text.isEmpty ||
        ProfileData3Screen.buildingNumber.text.isEmpty ||
        ProfileData3Screen.streetName.text.isEmpty ||
        addressCountry == null ||
        ProfileData2Screen.dateOfBirth.text.isEmpty) {
      //quick alert Please Complete your Mandatory Data
      errorModel = ErrorModel(message: AppStrings.mandatoryData);
      emit(CreatePatientErrorState(AppStrings.mandatoryData));
      if (kDebugMode) {
        print('firstName $firstName');
        print('secondName $secondName');
        print('thirdName $thirdName');
        print('last name $lastName');
        print('nationalId $nationalId');
        print('phone $phone');
        print('dateofBirth $dateofBirth');
        print('appartmentNumber $appartmentNumber');
        print('buildingNumber $buildingNumber');
        print('streetName $streetName');
        print('addressCountry $addressCountry');
      }
    } else if (addressState == null) {
      // quick Alert state is incomplete
      errorModel = ErrorModel(message: AppStrings.stateEmpty);
      emit(CreatePatientErrorState(AppStrings.stateEmpty));
    } else if (!isGender) {
      // quick Alert Gender is incomplete
      errorModel = ErrorModel(message: AppStrings.genderEmpty);
      emit(CreatePatientErrorState(AppStrings.genderEmpty));
    } else {
      emit(CreatePatientLoadingState());

      try {
        var response = await DioHelper.postData(
            url: AppConstants.createPatientPath,
            data: {
              "userId": AppConstants.adminStorage.read('userId'),
              "nationalId":
                  nationalId ?? ProfileData1Screen.nationalIdCard.text,
              "firstName": firstName ?? ProfileData1Screen.firstName.text,
              "secondName": secondName ?? ProfileData1Screen.secondName.text,
              "thirdName": thirdName ?? ProfileData1Screen.secondName.text,
              "lastName": lastName ?? ProfileData1Screen.secondName.text,
              "birthDate": dateofBirth ?? ProfileData2Screen.dateOfBirth.text,
              "religion": religionIndex,
              "gender": gender,
              "maritalStatus": getMaritalStatusIndex(),
              "nationality": nationalitty,
              "bloodType": bloodTypeIndex,
              "country": addressCountry,
              "state": addressState,
              "street": streetName ?? ProfileData3Screen.streetName.text,
              "buildingNumber":
                  buildingNumber ?? ProfileData3Screen.buildingNumber.text,
              "appartment":
                  appartmentNumber ?? ProfileData3Screen.appartmentNumber.text,
              "phoneNumber": phone ?? ProfileData1Screen.phoneController.text,
              "birthCountry": birthCountry,
              "birthState": birthState,
              "birthCity": birthCity,
              "height": height,
              "weight": weight,
              "job": job ?? ProfileData4Screen.job.text,
              "jobCountry": jobCountry,
              "jobState": jobState,
              "jobCity": jobCity,
              "patientPP": null,
            });
        patientModel = PatientModel.fromJson(response.data);
        // Save Patient Id

        AppConstants.adminStorage
            .write('patientId', patientModel?.patientData.patientId);
        AppConstants.adminStorage
            .write('fullName', patientModel?.patientData.fullName);

        print(AppConstants.adminStorage.read('patientId'));
        print(AppConstants.adminStorage.read('fullName'));

        AppConstants.adminStorage.write('isLogged', true);

        emit(CreatePatientSuccessfulState());
      } on DioError catch (error) {
        errorModel = ErrorModel.fromJson(json: error.response?.data);

        print(error.toString());
        emit(CreatePatientErrorState(error.toString()));
      }
    }
  }

  Future<void> getPatient({int? userId}) async {
    emit(GetPatientLoadingState());

    try {
      // get data from API
      var response = await DioHelper.postData(
          url: AppConstants.getPatientPath,
          data: {'userId': userId ?? AppConstants.adminStorage.read('userId')});
      print('Got Data from Api');
      // Saving data in UserModel
      patientModel = PatientModel.fromJson(response.data);

      // Saving PatientId for future use
      AppConstants.adminStorage
          .write('patientId', patientModel?.patientData.patientId);
      AppConstants.adminStorage
          .write('fullName', patientModel?.patientData.fullName);
      AppConstants.adminStorage
          .write('patientPP', patientModel?.patientData.patientPP);
      // AppConstants.adminStorage.write('fullName',
      //     '${patientModel?.patientData.firstName} ${patientModel?.patientData.lastName}');
      print(AppConstants.adminStorage.read('patientId'));
      print(AppConstants.adminStorage.read('patientId'));
      print(AppConstants.adminStorage.read('fullName'));

      emit(GetPatientSuccessfulState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
        // print('Error Stack :${errorModel?.stack}');
      }

      emit(GetPatientErrorState(error.toString()));
    }
  }
}

enum UserType { patient, doctor }

enum MaritalStatus {
  none,
  single,
  married,
  divorced,
  widow,
}
