import 'package:equatable/equatable.dart';

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
      day: json['day'],
      clinicScheduleId: json['clinicScheduleId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      notes: json['notes'],
      isAvailable: json['isAvailable'],
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
