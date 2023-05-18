import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital/network/remote/cache_helper.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:intl/intl.dart';

class AppConstants {
  static const splashDelay = 3;
  static const sliderAnimationTime = 1;
  static const obBoardingSlides = 3;

  // Main Api
  // emulator
  // http://10.0.2.2:3000

  // http://127.0.0.1:56224/Nme5DihmL3o=/
  // http://192.168.1.100:300
  // 192.168.137.15:39345
  // http://localhost:3000
  static const backendBaseUrl = 'http://10.0.2.2:8080/v1';
  static const loginPath = '$backendBaseUrl/auth/login';
  static const registerPath = '$backendBaseUrl/auth/register';
  static const logoutPath = '$backendBaseUrl/auth/logout';
  static const refreshTokenPath = '$backendBaseUrl/auth//refresh-tokens';

  static const createPatientPath = '$backendBaseUrl/patients/create';
  static const getPatientPath = '$backendBaseUrl/patients/get';
  static const updatePatientPath = '$backendBaseUrl/patients/update';
  static const getAllDoctorsPath = '$backendBaseUrl/doctors';
  static const getDoctorBySpecializationPath =
      '$backendBaseUrl/doctors/department';
  static const getDoctorByDegreePath = '$backendBaseUrl/doctors/degree';
  static const getDoctorByPositionPath = '$backendBaseUrl/doctors/position';
  static const getFavouriteDoctorPath = '$backendBaseUrl/doctors/favourite';
  static const getClinisShedulePath = '$backendBaseUrl/clinicsSkds/doctor';
  // static String accessToken = CacheHelper.getData(key: 'accessToken') ?? '';
  // static String refreshToken = CacheHelper.getData(key: 'refreshToken') ?? '';

  // static int userId = CacheHelper.getData(key: 'userId') ?? 0;
  // static int patientId = CacheHelper.getData(key: 'patientId') ?? 0;
  // static int doctorId = CacheHelper.getData(key: 'doctorId') ?? 0;

  static GetStorage adminStorage = GetStorage();

  //  Articles Api
  // https://newsapi.org/v2/top-headlines?
  // https://newsapi.org/
  // v2/top-headlines?
  // country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
  // my apikey : 97a2f0178be846b897d27b8f38d8571c
  static const articlesBaseUrl = 'https://newsapi.org/';
  static const articlesPath = '${articlesBaseUrl}v2/top-headlines';
  static const country = 'us';
  static const category = 'health';
  static const articlesApiKey = '97a2f0178be846b897d27b8f38d8571c';

  static List<Widget> specializationIcons = [
    FaIcon(
      FontAwesomeIcons.syringe,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Anesthetics
    FaIcon(
      FontAwesomeIcons.heartPulse,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Cardiology
    FaIcon(
      FontAwesomeIcons.earListen,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Ear, nose and throat (ENT)
    FaIcon(
      FontAwesomeIcons.nutritionix,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Gastroenterology
    Icon(
      Icons.healing,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // General Surgery
    Icon(
      Icons.woman,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Gynecology
    FaIcon(
      FontAwesomeIcons.droplet,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Hematology
    FaIcon(
      FontAwesomeIcons.baby,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Neonatal Unit
    FaIcon(
      FontAwesomeIcons.brain,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Neurology
    FaIcon(
      FontAwesomeIcons.appleWhole,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Nutrition and dietetics
    Icon(
      Icons.pregnant_woman,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Obstetrics and gynecology units
    FaIcon(
      FontAwesomeIcons.disease,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Oncology
    FaIcon(
      FontAwesomeIcons.eye,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Ophthalmology
    FaIcon(
      FontAwesomeIcons.xRay,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Orthopedics
    FaIcon(
      FontAwesomeIcons.personWalking,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Physiotherapy
    Icon(
      Icons.medication_liquid,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Renal Unit
    Icon(
      Icons.male,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Sexual Health
    FaIcon(
      FontAwesomeIcons.toilet,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Urology
    FaIcon(
      FontAwesomeIcons.tooth,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // Dentistry
    FaIcon(
      FontAwesomeIcons.brain,
      color: ColorManager.primary,
      size: FontSize.s30,
    ), // neurology
  ];

  static const List<String> specializations = [
    'Anesthetics',
    'Cardiology',
    'Ear, nose and throat (ENT)',
    'Gastroenterology',
    'General Surgery',
    'Gynecology',
    'Hematology',
    'Neonatal Unit',
    'Neurology',
    'Nutrition and dietetics',
    'Obstetrics and gynecology units',
    'Oncology',
    'Ophthalmology',
    'Orthopedics',
    'Physiotherapy',
    'Renal Unit',
    'Sexual Health',
    'Urology',
    'Dentistry',
    'neorocycatric',
  ];

  static const List<String> degrees = [
    'Bachelor',
    'Postgraduate Diploma',
    'Egyptian Associate degree',
    'Fellowship',
    'Royal Membership',
    'Master',
    'PhD',
  ];

  static const List<String> positions = [
    'Internship Doctor',
    'Resident Doctor',
    'Specialist Doctor',
    'Senior Specialist',
    'Consultant Doctor',
    'Senior Consultant',
    'Chief Resident',
    'Head of Department',
    'Medical Director',
  ];

  static final List<String> monthNames = [
    '', // index 0 is unused
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  static final List<String> weekDayNames = DateFormat.E().dateSymbols.WEEKDAYS;
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

String? token = (CacheHelper.getData(key: 'token'));
