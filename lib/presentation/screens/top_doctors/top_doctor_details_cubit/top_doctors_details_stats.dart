abstract class TopDoctorsDetailsState {}

class TopDoctorsDetailsInitialState extends TopDoctorsDetailsState {}

class GetTopDoctorsDetailsLoadingState extends TopDoctorsDetailsState {}

class GetTopDoctorsDetailsSuccessState extends TopDoctorsDetailsState {}

class GetTopDoctorsDetailsErrorState extends TopDoctorsDetailsState {
  final String error;

  GetTopDoctorsDetailsErrorState(this.error);
}
