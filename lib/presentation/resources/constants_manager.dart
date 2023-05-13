import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital/network/remote/cache_helper.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:intl/intl.dart';

class AppConstants {
  static const splashDelay = 3;
  static const sliderAnimationTime = 1;
  static const obBoardingSlides = 3;

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

  static const mainBaseUrl = '';
  static const mainApiKey = '';

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
      FontAwesomeIcons.toilet
      ,
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
