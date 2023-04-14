import 'package:equatable/equatable.dart';

class CaseDiagnose extends Equatable {
  final String department;
  final String departmentIconUrl;
  final String doctor;
  final String location;
  final String complaint;
  final String diagnosis;
  final String clinicalExamination;
  final String dateTime;
  final String notes;

  const CaseDiagnose(
      {required this.department,
      required this.departmentIconUrl,
      required this.doctor,
      required this.location,
      required this.complaint,
      required this.diagnosis,
      required this.clinicalExamination,
      required this.dateTime,
      required this.notes});

  factory CaseDiagnose.fromJson(Map<String, dynamic> json) {
    return CaseDiagnose(
        department: json['department'],
        doctor: json['doctor'],
        location: json['location'],
        complaint: json['complaint'],
        diagnosis: json['diagnosis'],
        clinicalExamination: json['clinicalExamination'],
        dateTime: json['dateTime'],
        notes: json['notes'],
        departmentIconUrl: json['departmentIcon']);
  }

  @override
  List<Object> get props => [
        department,
        doctor,
        location,
        complaint,
        diagnosis,
        clinicalExamination,
        dateTime,
        notes,
        departmentIconUrl
      ];
}
