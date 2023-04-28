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

class GetClinicsScheduleListLoadingState extends AppointmentStates {}

class GetClinicsScheduleListSuccessState extends AppointmentStates {}

class GetClinicsScheduleListErrorState extends AppointmentStates {
  final String error;

  GetClinicsScheduleListErrorState(this.error);
}

class CancelAppointmentLoadingState extends AppointmentStates {}

class CancelAppointmentSuccessState extends AppointmentStates {}

class CancelAppointmentErrorState extends AppointmentStates {
  final String error;

  CancelAppointmentErrorState(this.error);
}

class ChangeReasonIndexState extends AppointmentStates {}
