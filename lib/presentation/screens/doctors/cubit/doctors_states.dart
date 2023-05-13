abstract class DoctorsStates {}

class DoctorsInitialState extends DoctorsStates {}

class GetDoctorsLoadingState extends DoctorsStates {}

class GetDoctorsSuccessState extends DoctorsStates {}

class GetDoctorsErrorState extends DoctorsStates {
  final String error;

  GetDoctorsErrorState(this.error);
}

class ChangeViewType extends DoctorsStates {}

class GetDoctorDetailsLoadingState extends DoctorsStates {}

class GetDoctorDetailsSuccessState extends DoctorsStates {}

class GetDoctorDetailsErrorState extends DoctorsStates {
  final String error;

  GetDoctorDetailsErrorState(this.error);
}
