import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/appointment_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_states.dart';

class AppointmentsCubit extends Cubit<AppointmentStates> {
  AppointmentsCubit() : super(AppointmentsInitialState());

  AppointmentsCubit get(context) => BlocProvider.of(context);

  List<AppointmentModel> upcomingAppointments = [];

  Future<void> getUpcomingAppointmentsList() async {
    emit(GetUpcomingAppointmentsLoadingState());

    try {
      // var response =
      //     await DioHelper.getData(url: AppConstants.articlesPath, query: {
      //   'country': AppConstants.country,
      //   'category': AppConstants.category,
      //   'apiKey': AppConstants.articlesApiKey,
      // });
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      // dummy data to be removed when api is ready
      upcomingAppointments = [
        appointment1,
        appointment1,
        appointment1,
        appointment1,
      ];
      emit(GetUpcomingAppointmentsSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetUpcomingAppointmentsErrorState(error.toString()));
    }
  }

  List<AppointmentModel> completedAppointments = [];

  Future<void> getCompletedAppointmentsList() async {
    emit(GetCompletedAppointmentsLoadingState());

    try {
      // var response =
      //     await DioHelper.getData(url: AppConstants.articlesPath, query: {
      //   'country': AppConstants.country,
      //   'category': AppConstants.category,
      //   'apiKey': AppConstants.articlesApiKey,
      // });
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      // dummy data to be removed when api is ready
      completedAppointments = [
        appointment1,
        appointment1,
        appointment1,
        appointment1,
        appointment1,
        appointment1,
      ];
      emit(GetCompletedAppointmentsSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetCompletedAppointmentsErrorState(error.toString()));
    }
  }

  List<AppointmentModel> cancelledAppointments = [];
  Future<void> getCancelledAppointmentsList() async {
    emit(GetCancelledAppointmentsLoadingState());

    try {
      // var response =
      //     await DioHelper.getData(url: AppConstants.articlesPath, query: {
      //   'country': AppConstants.country,
      //   'category': AppConstants.category,
      //   'apiKey': AppConstants.articlesApiKey,
      // });
      //print(response.data['articles'][1]);
      // caseDiagnosisList = List.from(response.data['articles'])
      //     .map((e) => CaseDiagnose.fromJson(e))
      //     .toList();
      // print(articles[1]);

      // dummy data to be removed when api is ready
      cancelledAppointments = [
        appointment1,
        appointment1,
      ];
      emit(GetCancelledAppointmentsSuccessState());
    } catch (error) {
      print(error.toString());
      emit(GetCancelledAppointmentsErrorState(error.toString()));
    }
  }
}
