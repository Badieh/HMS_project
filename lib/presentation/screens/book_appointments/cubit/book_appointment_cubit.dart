import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_states.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentStates> {
  BookAppointmentCubit() : super(BookAppointmentInitialState());

  BookAppointmentCubit get(context) => BlocProvider.of(context);

  List<ClinicsScheduleModel> clinicsScheduleList = [];
  getclinicsScheduleList(
      {required List<ClinicsScheduleModel> clinicsScheduleList}) {
    this.clinicsScheduleList = clinicsScheduleList;
  }

  List<ClinicsScheduleModel> modifiedClinicsScheduleList = [];

  getTimesOfDay(int day) {
    print('day is $day');
    modifiedClinicsScheduleList = [];
    clinicsScheduleList.forEach((element) {
      if (element.day == day) {
        modifiedClinicsScheduleList.add(element);
      }
    });
    print(modifiedClinicsScheduleList);
    print('no of times is ${modifiedClinicsScheduleList.length}');
    emit(GetTimesOfDaySuccessState());
  }

  String selectedTime = '';
  changeSelectedTime(String selected) {
    selectedTime = selected;

    emit(ChangeSelectedTime());
  }
}
