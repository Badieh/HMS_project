import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/appointment_model.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/error_model.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_states.dart';

class AppointmentsCubit extends Cubit<AppointmentStates> {
  AppointmentsCubit() : super(AppointmentsInitialState());

  AppointmentsCubit get(context) => BlocProvider.of(context);
  ErrorModel? errorModel;
  AppointmentsListofModels? appointmentsListofModels;
  List<AppointmentModel> upcomingAppointments = [];

  Future<void> getUpcomingAppointmentsList() async {
    emit(GetUpcomingAppointmentsLoadingState());

    try {
      var response = await DioHelper.postData(
          url: AppConstants.getUpcomingAppointments,
          data: {'userId': AppConstants.adminStorage.read('userId')});
      appointmentsListofModels =
          AppointmentsListofModels.fromJson(response.data);
      upcomingAppointments = appointmentsListofModels!.appointmentModels;

      // dummy data to be removed when api is ready
      // upcomingAppointments = [
      //   appointment1,
      //   appointment1,
      //   appointment1,
      //   appointment1,
      // ];
      emit(GetUpcomingAppointmentsSuccessState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
        emit(GetUpcomingAppointmentsErrorState(error.toString()));
      }
    }
  }

  List<AppointmentModel> completedAppointments = [];

  Future<void> getCompletedAppointmentsList() async {
    emit(GetCompletedAppointmentsLoadingState());

    try {
      var response = await DioHelper.postData(
          url: AppConstants.getCompletedAppointments,
          data: {'userId': AppConstants.adminStorage.read('userId')});
      appointmentsListofModels =
          AppointmentsListofModels.fromJson(response.data);
      completedAppointments = appointmentsListofModels!.appointmentModels;

      emit(GetCompletedAppointmentsSuccessState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
        print(error.toString());
        emit(GetCompletedAppointmentsErrorState(error.toString()));
      }
    }
  }

  List<AppointmentModel> cancelledAppointments = [];
  Future<void> getCancelledAppointmentsList() async {
    emit(GetCancelledAppointmentsLoadingState());

    try {
      var response = await DioHelper.postData(
          url: AppConstants.getCompletedAppointments,
          data: {'userId': AppConstants.adminStorage.read('userId')});
      appointmentsListofModels =
          AppointmentsListofModels.fromJson(response.data);
      cancelledAppointments = appointmentsListofModels!.appointmentModels;

      emit(GetCancelledAppointmentsSuccessState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
        print(error.toString());
        emit(GetCompletedAppointmentsErrorState(error.toString()));
      }
    }
  }

  ClinicsListOfModels? _clinicsListOfModels;

  List<ClinicsScheduleModel> clinicsScheduleList = [];
  Future<void> getClinicsSchedule({required String docId}) async {
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
      emit(GetClinicsScheduleListSuccessState());
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
      }
      emit(GetClinicsScheduleListErrorState(error.toString()));
    }
  }

  Future<void> cancelAppointment({required int appointmentId}) async {
    emit(CancelAppointmentLoadingState());

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

      getUpcomingAppointmentsList();
      emit(CancelAppointmentSuccessState());
    } catch (error) {
      print(error.toString());
      emit(CancelAppointmentErrorState(error.toString()));
    }
  }

  String selectedReason = AppStrings.reason1;
  changeSelectedReason({required String index}) {
    selectedReason = index;
    emit(ChangeReasonIndexState());
  }
}
