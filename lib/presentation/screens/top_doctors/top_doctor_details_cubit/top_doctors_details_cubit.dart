import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctor_details_cubit/top_doctors_details_stats.dart';

class TopDoctorsDetailsCubit extends Cubit<TopDoctorsDetailsState> {
  TopDoctorsDetailsCubit() : super(TopDoctorsDetailsInitialState());

  static TopDoctorsDetailsCubit get(context) => BlocProvider.of(context);


  List<ClinicsScheduleModel> topDoctorsDetails = [];
  void getTopDoctorsDetails() async {
    if (topDoctorsDetails.isEmpty) {
      emit(GetTopDoctorsDetailsLoadingState());

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
        topDoctorsDetails = [
          clinicsScheduleModel_1,
          clinicsScheduleModel_1,
          clinicsScheduleModel_1,
          clinicsScheduleModel_1,
        ];
        emit(GetTopDoctorsDetailsSuccessState());
      } catch (error) {
      //   print(error.toString());
      //   emit(GetTopDoctorsDetailsErrorState(error.toString()));
      }
    // } else {
      emit(GetTopDoctorsDetailsSuccessState());
    }
  }
  // emit the new list of doctors to the UI
  emit(topDoctorsDetails);



}