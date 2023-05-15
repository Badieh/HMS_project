import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_states.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit() : super(DoctorsInitialState());

  static DoctorsCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> doctors = [];
  var degree;
  var position;
  var specialization;
  Future<void> getDoctors() async {
    emit(GetDoctorsLoadingState());

    if (specialization != null) {
      try {
        //   var response =
        //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
        //     'country': AppConstants.country,
        //     'category': AppConstants.category,
        //     'apiKey': AppConstants.articlesApiKey,
        //   });
        //   //print(response.data['articles'][1]);
        //   topDoctors = List.from(response.data['topDoctors'])
        //       .map((e) => TopDoctorModel.fromJson(e))
        //       .toList();

        // print(articles[1]);
        //
        print(
            'trying to get doctors with specialization: ${AppConstants.specializations[specialization]}');
        doctors = [
          Doctor1,
          Doctor2,
          Doctor1,
          Doctor1,



        ];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        //   print(error.toString());
        //   emit(GetTopDoctorsErrorState(error.toString()));
      }
    } else if (degree != null) {
      try {
        //   var response =
        //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
        //     'country': AppConstants.country,
        //     'category': AppConstants.category,
        //     'apiKey': AppConstants.articlesApiKey,
        //   });
        //   //print(response.data['articles'][1]);
        //   topDoctors = List.from(response.data['topDoctors'])
        //       .map((e) => TopDoctorModel.fromJson(e))
        //       .toList();

        // print(articles[1]);

        print(
            'trying to get doctors with degree: ${AppConstants.degrees[degree]}');
        doctors = [
          Doctor1,
          Doctor2,
          Doctor1,
          Doctor1,
        ];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
    } else if (position != null) {
      try {
        //   var response =
        //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
        //     'country': AppConstants.country,
        //     'category': AppConstants.category,
        //     'apiKey': AppConstants.articlesApiKey,
        //   });
        //   //print(response.data['articles'][1]);
        //   topDoctors = List.from(response.data['topDoctors'])
        //       .map((e) => TopDoctorModel.fromJson(e))
        //       .toList();

        // print(articles[1]);

        print(
            'trying to get doctors with postion: ${AppConstants.positions[position]}');
        doctors = [
          Doctor1,
          Doctor2,
          Doctor1,
          Doctor1,
        ];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
    } else {
      try {
        //   var response =
        //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
        //     'country': AppConstants.country,
        //     'category': AppConstants.category,
        //     'apiKey': AppConstants.articlesApiKey,
        //   });
        //   //print(response.data['articles'][1]);
        //   topDoctors = List.from(response.data['topDoctors'])
        //       .map((e) => TopDoctorModel.fromJson(e))
        //       .toList();

        // print(articles[1]);

        print('trying to get all doctors');
        doctors = [
          Doctor1,
          Doctor2,
          Doctor1,
          Doctor1,
          Doctor2,
          Doctor2,
          Doctor2,

        ];
        emit(GetDoctorsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorsErrorState(error.toString()));
      }
    }
  }

  // Use False for GridView $ True for LisView
  bool viewType = false;
  void changeViewType() {
    viewType = !viewType;
    emit(ChangeViewType());
  }

  late DoctorModel selectedDoctor;

  static List<ClinicsScheduleModel> clinicsScheduleList = [];
  Future<void> getDoctorDetails({required int docId}) async {
    if (clinicsScheduleList.isEmpty) {
      emit(GetDoctorDetailsLoadingState());

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
        clinicsScheduleList = [
          clinicsScheduleModel_1,
          clinicsScheduleModel_4,
          clinicsScheduleModel_1,
          clinicsScheduleModel_2,
          clinicsScheduleModel_4,
          clinicsScheduleModel_3,
          clinicsScheduleModel_1,
        ];
        emit(GetDoctorDetailsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorDetailsErrorState(error.toString()));
      }
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
