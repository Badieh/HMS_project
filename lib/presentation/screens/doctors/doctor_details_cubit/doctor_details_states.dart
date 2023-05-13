abstract class DoctorsDetailsStates {}

class DoctorDetailsInitialState extends DoctorsDetailsStates {}

class GetDoctorDetailsLoadingState extends DoctorsDetailsStates {}

class GetDoctorDetailsSuccessState extends DoctorsDetailsStates {}

class GetDoctorDetailsErrorState extends DoctorsDetailsStates {
  final String error;

  GetDoctorDetailsErrorState(this.error);
}
