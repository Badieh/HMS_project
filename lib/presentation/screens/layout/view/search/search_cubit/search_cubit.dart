import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/presentation/screens/layout/view/search/search_cubit/search_stats.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);


  List<DoctorModel> searchList = [];
  void getSearch() async {
    if (searchList.isEmpty) {
      emit(GetSearchLoadingState());



      //   try {
      //     final results = await ;
      //     emit(GetSearchSuccessState());
      //   } catch (error) {
      //     emit(GetSearchErrorState(error.toString()));
      //   }
      // }
      //==================================OR=========================================
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
      //
      //   // print(articles[1]);
      //   searchList = [
      //     Doctor1,
      //     Doctor2,
      //     Doctor1,
      //     Doctor1,
      //   ];
        emit(GetSearchSuccessState());
      } catch (error) {
      // //   print(error.toString());
      //   emit(GetSearchErrorState(error.toString()));
      }
    // } else {
      emit(GetSearchSuccessState());
    }
  }
  // emit the new list of doctors to the UI
  emit(searchList);



}