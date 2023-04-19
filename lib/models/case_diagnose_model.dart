import 'package:equatable/equatable.dart';

class CaseDiagnose extends Equatable {
  final String hospitalName;
  final String departmentName;
  final String departmentIconUrl;
  final String departmentIconHash;
  final String doctorName;
  final String patientName;
  final String location;
  final String complaint;
  final String diagnosis;
  final String clinicalExamination;
  final String dateTime;
  final String? notes;

  const CaseDiagnose(
      {required this.departmentName,
      required this.departmentIconUrl,
      required this.hospitalName,
      required this.doctorName,
      required this.patientName,
      required this.location,
      required this.complaint,
      required this.diagnosis,
      required this.clinicalExamination,
      required this.dateTime,
      this.notes,
      this.departmentIconHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I'});

  factory CaseDiagnose.fromJson(Map<String, dynamic> json) {
    return CaseDiagnose(
        departmentName: json['departmentName'],
        doctorName: json['doctorName'],
        patientName: json['patientName'],
        location: json['location'],
        complaint: json['complaint'],
        diagnosis: json['diagnosis'],
        clinicalExamination: json['clinicalExamination'],
        dateTime: json['dateTime'],
        notes: json['notes'],
        hospitalName: json['hospitalName'],
        // departmentIconHash: json['departmentIconHash'],
        departmentIconUrl: json['departmentIcon']);
  }

  @override
  List<Object> get props => [
        departmentName,
        doctorName,
        location,
        complaint,
        diagnosis,
        clinicalExamination,
        dateTime,
        departmentIconUrl
      ];
}
