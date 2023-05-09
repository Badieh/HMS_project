import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/screens/specializations/cubit/specializations_states.dart';

class SpecializationsCubit extends Cubit<SpecializationsStates> {
  SpecializationsCubit() : super(SpecializationInitialState());

  SpecializationsCubit get(context) => BlocProvider.of(context);

  // Use False for GridView $ True for LisView
  bool viewType = false;
  void changeViewType() {
    viewType = !viewType;
    emit(ChangeViewType());
  }
}
