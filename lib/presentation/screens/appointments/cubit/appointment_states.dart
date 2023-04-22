class AppointmentStates {}

class AppointmentsInitialState extends AppointmentStates {}

class GetUpcomingAppointmentsLoadingState extends AppointmentStates {}

class GetUpcomingAppointmentsSuccessState extends AppointmentStates {}

class GetUpcomingAppointmentsErrorState extends AppointmentStates {
  final String error;

  GetUpcomingAppointmentsErrorState(this.error);
}

class GetCompletedAppointmentsLoadingState extends AppointmentStates {}

class GetCompletedAppointmentsSuccessState extends AppointmentStates {}

class GetCompletedAppointmentsErrorState extends AppointmentStates {
  final String error;

  GetCompletedAppointmentsErrorState(this.error);
}

class GetCancelledAppointmentsLoadingState extends AppointmentStates {}

class GetCancelledAppointmentsSuccessState extends AppointmentStates {}

class GetCancelledAppointmentsErrorState extends AppointmentStates {
  final String error;

  GetCancelledAppointmentsErrorState(this.error);
}