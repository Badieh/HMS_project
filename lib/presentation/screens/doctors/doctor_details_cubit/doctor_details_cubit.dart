import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/screens/doctors/doctor_details_cubit/doctor_details_states.dart';

class DoctorDetailsCubit extends Cubit<DoctorsDetailsStates> {
  DoctorDetailsCubit() : super(DoctorDetailsInitialState());

  static DoctorDetailsCubit get(context) => BlocProvider.of(context);

  static List<ClinicsScheduleModel> clinicsScheduleList = [];
  Future<void> getDoctorDetails({required int docId}) async {
    if (clinicsScheduleList.isEmpty) {
      emit(GetDoctorDetailsLoadingState());

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
        clinicsScheduleList = [
          clinicsScheduleModel_1,
          clinicsScheduleModel_4,
          clinicsScheduleModel_1,
          clinicsScheduleModel_2,
          clinicsScheduleModel_4,
          clinicsScheduleModel_3,
          clinicsScheduleModel_1,
        ];
        emit(GetDoctorDetailsSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetDoctorDetailsErrorState(error.toString()));
      }
      // } else {
    }
  }


}
