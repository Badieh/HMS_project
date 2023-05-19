import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/models/error_model.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_states.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit() : super(DoctorsInitialState());

  static DoctorsCubit get(context) => BlocProvider.of(context);

  // Use False for GridView $ True for LisView
  bool viewType = false;
  void changeViewType() {
    viewType = !viewType;
    emit(ChangeViewType());
  }

  ErrorModel? errorModel;
  DoctorsListOfModels? doctorsResponse;

  List<DoctorModel> doctors = [];
  var degree;
  var position;
  var specialization;
  bool favourites = false;
  Future<void> getDoctors() async {
    emit(GetDoctorsLoadingState());

    if (specialization != null) {
      try {
        var response = await DioHelper.postData(
            url: AppConstants.getDoctorBySpecializationPath,
            data: {'departmentName': specialization});
        doctorsResponse = DoctorsListOfModels.fromJson(response.data);

        print('trying to get doctors with specialization: $specialization}');
        doctors = doctorsResponse?.doctors ?? [];
        emit(GetDoctorsSuccessState());
      } on DioError catch (error) {
        errorModel = ErrorModel.fromJson(json: error.response?.data);
        if (kDebugMode) {
          print(error.toString());
          print('Error code :${errorModel?.statusCode}');
          print('Error Message :${errorModel?.message}');
        }
        emit(GetDoctorsErrorState(error.toString()));
      }
    } else if (degree != null) {
      try {
        var response = await DioHelper.postData(
            url: AppConstants.getDoctorByDegreePath, data: {'degree': degree});
        doctorsResponse = DoctorsListOfModels.fromJson(response.data);

        print(
            'trying to get doctors with Degree: ${AppConstants.degrees[specialization]}}');
        doctors = doctorsResponse?.doctors ?? [];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
    } else if (position != null) {
      try {
        var response = await DioHelper.postData(
            url: AppConstants.getDoctorByPositionPath,
            data: {'position': position});
        doctorsResponse = DoctorsListOfModels.fromJson(response.data);

        print(
            'trying to get doctors with postion: ${AppConstants.positions[position]}');
        doctors = doctorsResponse?.doctors ?? [];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
    } else if (favourites == true) {
      try {
        var response = await DioHelper.postData(
            url: AppConstants.getFavouriteDoctorPath,
            data: {'userId': AppConstants.adminStorage.read('userId')});
        doctorsResponse = DoctorsListOfModels.fromJson(response.data);

        print('trying to get Favourite doctors');

        doctors = doctorsResponse?.doctors ?? [];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
      favourites = false;
    } else {
      try {
        var response = await DioHelper.getData(
          data: {},
          url: AppConstants.getAllDoctorsPath,
        );
        doctorsResponse = DoctorsListOfModels.fromJson(response.data);

        print('trying to get all doctors');

        doctors = doctorsResponse?.doctors ?? [];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
    }
  }

  late DoctorModel selectedDoctor;
  ClinicsListOfModels? _clinicsListOfModels;
  static List<ClinicsScheduleModel> clinicsScheduleList = [];
  Future<void> getDoctorDetails({required int docId}) async {
    emit(GetDoctorDetailsLoadingState());

    try {
      var response = await DioHelper.postData(
          url: AppConstants.getClinisShedulePath, data: {'doctorId': docId});
      _clinicsListOfModels = ClinicsListOfModels.fromJson(response.data);

      clinicsScheduleList = _clinicsListOfModels?.clinicsSheduleList ?? [];
      // clinicsScheduleList = [
      //   clinicsScheduleModel_1,
      //   clinicsScheduleModel_4,
      //   clinicsScheduleModel_1,
      //   clinicsScheduleModel_2,
      //   clinicsScheduleModel_4,
      //   clinicsScheduleModel_3,
      //   clinicsScheduleModel_1,
      // ];
      emit(GetDoctorDetailsSuccessState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
      }
      emit(GetDoctorDetailsErrorState(error.toString()));

      // } else {
    }
  }

  List<List<String>> convertToNestedList() {
    // Sort by day of the week then start time
    clinicsScheduleList.sort((a, b) {
      final dayComparison = a.day.compareTo(b.day);
      if (dayComparison != 0) {
        return dayComparison;
      } else {
        return a.startTime.compareTo(b.startTime);
      }
    });

    // Add the headers as the first sublist
    final nestedList = <List<String>>[
      [
        'Day',
        'From',
        'To',
      ],
      ...clinicsScheduleList.map((schedule) => [
            AppConstants.weekDayNames[schedule.day],
            schedule.startTime,
            schedule.endTime,
          ])
    ];
    return nestedList;
  }
}
