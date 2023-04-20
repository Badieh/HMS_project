abstract class TopDoctorsState {}

class TopDoctorsInitialState extends TopDoctorsState {}

class GetTopDoctorsLoadingState extends TopDoctorsState {}

class GetTopDoctorsSuccessState extends TopDoctorsState {}

class GetTopDoctorsErrorState extends TopDoctorsState {
  final String error;

  GetTopDoctorsErrorState(this.error);
}
