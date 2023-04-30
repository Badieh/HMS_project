import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/screens/auth/profile_data/cubit/profile_data_states.dart';

class ProfileDataCubit extends Cubit<ProfileDataStates> {
  ProfileDataCubit() : super(ProfileDtateInitialState());

  ProfileDataCubit get(context) => BlocProvider.of(context);

  final List<String> bloodTypes = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  String? bloodType;
  void changeBloodType({required String type}) {
    bloodType = type;
    emit(ChangeBloodTypeState());
  }

  bool isMale = true;
  void changeGender() {
    isMale = !isMale;
    emit(ChangeGenderState());
  }

  MaritalStatus maritalStatus = MaritalStatus.single;

  void changeMaritalStatus({required MaritalStatus status}) {
    maritalStatus = status;
    emit(ChangeMaritalStatusState());
  }

  final TextEditingController heightController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  double height = 170.0;
  void changeHeight(double value) {
    height = value;
    heightController.text = value.toStringAsFixed(1);
    emit(ChangeHeightState());
  }

  double weight = 80;
  void changeWeight(double value) {
    weight = value;
    //weightController.text = value.toStringAsFixed(1);

    emit(ChangeWeightState());
  }
}

enum MaritalStatus {
  single,
  married,
  divorced,
  widow,
}
