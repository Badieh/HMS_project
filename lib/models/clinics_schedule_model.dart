import 'package:equatable/equatable.dart';

class ClinicsListOfModels {
  final List<ClinicsScheduleModel> clinicsSheduleList;
  final int statusCode;
  final String message;

  ClinicsListOfModels(
      {required this.clinicsSheduleList,
      required this.statusCode,
      required this.message});

  factory ClinicsListOfModels.fromJson(Map<String, dynamic> json) {
    List<ClinicsScheduleModel> clinicsSheduleList = [];
    if (json['clinicsSkds'] != null) {
      var clinicsSkdsJson = json['clinicsSkds'] as List;
      clinicsSheduleList = clinicsSkdsJson
          .map((clinicsSkdsJson) =>
              ClinicsScheduleModel.fromJson(clinicsSkdsJson))
          .toList();
    }
    return ClinicsListOfModels(
      clinicsSheduleList: clinicsSheduleList,
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}

class ClinicsScheduleModel extends Equatable {
  final int clinicScheduleId;
  final int day;
  final String startTime;
  final String endTime;
  final bool isAvailable;
  final String? notes;

  const ClinicsScheduleModel(
      {required this.day,
      required this.startTime,
      required this.clinicScheduleId,
      required this.endTime,
      this.isAvailable = true,
      required this.notes});

  factory ClinicsScheduleModel.fromJson(Map<String, dynamic> json) {
    return ClinicsScheduleModel(
      day: json['dayOfWeek'],
      clinicScheduleId: json['skdId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      notes: json['note'],
      isAvailable: json['isAvaiLable'],
    );
  }

  @override
  List<Object?> get props => [
        day,
        startTime,
        clinicScheduleId,
        endTime,
        notes,
      ];
}
