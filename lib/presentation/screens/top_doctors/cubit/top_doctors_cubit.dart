import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/top_doctors_model.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/screens/top_doctors/cubit/top_doctors_stats.dart';

class TopDoctorsCubit extends Cubit<TopDoctorsState> {
  TopDoctorsCubit() : super(TopDoctorsInitialState());

  static TopDoctorsCubit get(context) => BlocProvider.of(context);


  List<TopDoctorModel> topDoctors = [];
  void getTopDoctors() async {
    if (topDoctors.isEmpty) {
      emit(GetTopDoctorsLoadingState());

      try {
      //   var response =
      //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
      //     'country': AppConstants.country,
      //     'category': AppConstants.category,
      //     'apiKey': AppConstants.articlesApiKey,
      //   });
      //   //print(response.data['articles'][1]);
      //   topDoctors = List.from(response.data['topDoctors'])
      //       .map((e) => TopDoctorModel.fromJson(e))
      //       .toList();

        // print(articles[1]);
        topDoctors = [
          Doctor1,
          Doctor1,
          Doctor1,
          Doctor1,
        ];
        emit(GetTopDoctorsSuccessState());
      } catch (error) {
      //   print(error.toString());
      //   emit(GetTopDoctorsErrorState(error.toString()));
      }
    // } else {
      emit(GetTopDoctorsSuccessState());
    }
  }
  // emit the new list of doctors to the UI
  emit(topDoctors);

}