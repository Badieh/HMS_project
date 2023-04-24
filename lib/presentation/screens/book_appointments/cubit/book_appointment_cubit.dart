import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_states.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit() : super(BookAppointmentInitialState());

  BookAppointmentCubit get(context) => BlocProvider.of(context);

  List<ClinicsScheduleModel> clinicsScheduleList = [];
  void getclinicsScheduleList(
      {required List<ClinicsScheduleModel> clinicsScheduleList}) {
    this.clinicsScheduleList = clinicsScheduleList;
  }

  List<ClinicsScheduleModel> modifiedClinicsScheduleList = [];
  String selectedStartTime = '';
  String selectedEndTime = '';
  int date = 0;
  void getTimesOfDay(int day) {
    print('day is $day');
    modifiedClinicsScheduleList = [];
    clinicsScheduleList.forEach((element) {
      if (element.day == day) {
        modifiedClinicsScheduleList.add(element);
      }
    });
    if (modifiedClinicsScheduleList.isNotEmpty) {
      selectedStartTime = modifiedClinicsScheduleList.first.startTime;
      selectedEndTime = modifiedClinicsScheduleList.first.endTime;
    }

    print(modifiedClinicsScheduleList);
    print('no of times is ${modifiedClinicsScheduleList.length}');
    emit(GetTimesOfDaySuccessState());
  }

  int selectedTimeIndex = -1; // Initialize to the first time slot index
  void changeSelectedTime(int newIndex, String startTime, String endTime) {
    selectedTimeIndex = newIndex;
    selectedStartTime = startTime;
    selectedEndTime = endTime;

    print(selectedStartTime);
    print(selectedEndTime);
    emit(ChangeSelectedTime());
  }

  Future<void> bookAppointment() async {
    if (date != 0 &&
        selectedStartTime.isNotEmpty &&
        selectedEndTime.isNotEmpty) {
      emit(BookAppointmentLoadingState());
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

        emit(BookAppointmentSuccessState());
      } catch (error) {
        print(error.toString());
        emit(BookAppointmentErrorState(error.toString()));
      }
    } else {
      print('Date or Time is missing');
      emit(BookAppointmentErrorState('Date or Time is missing'));
    }
  }
}
