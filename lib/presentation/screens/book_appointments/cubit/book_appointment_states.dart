class BookAppointmentStates {}

class BookAppointmentInitialState extends BookAppointmentStates {}

class GetTimesOfDayLoadingState extends BookAppointmentStates {}

class GetTimesOfDaySuccessState extends BookAppointmentStates {}

class GetTimesOfDayErrorState extends BookAppointmentStates {
  final String error;

  GetTimesOfDayErrorState(this.error);
}

class ChangeSelectedTime extends BookAppointmentStates {}

class BookAppointmentLoadingState extends BookAppointmentStates {}

class BookAppointmentSuccessState extends BookAppointmentStates {}

class BookAppointmentErrorState extends BookAppointmentStates {
  final String error;

  BookAppointmentErrorState(this.error);
}
