import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final int apptId;
  final int patientId;
  final int clinicsSkdId;
  final String date;
  final String startTime;
  final String endTime;
  final String doctorName;
  final String hospitalName;
  final int departmentId;
  final String doctorImageUrl;
  final String? doctorImageHash;
  final String apptState;
  final String? report;
  final String patientComplaint;
  final String? note;
  final String? cancelReason;
  final String updatedAt;
  final String createdAt;

  const AppointmentModel({
    required this.apptId,
    required this.patientId,
    required this.clinicsSkdId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.doctorName,
    required this.hospitalName,
    required this.departmentId,
    required this.doctorImageUrl,
    this.doctorImageHash,
    required this.apptState,
    this.report,
    required this.patientComplaint,
    this.note,
    this.cancelReason,
    required this.updatedAt,
    required this.createdAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      apptId: json['apptId'],
      patientId: json['patientId'],
      clinicsSkdId: json['clinicsSkdId'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      doctorName: json['doctorName'],
      hospitalName: json['hospitalName'],
      departmentId: json['departmentId'],
      doctorImageUrl: json['doctorImageUrl'],
      doctorImageHash: json['doctorImageHash'],
      apptState: json['apptState'],
      report: json['report'],
      patientComplaint: json['patientComplaint'],
      note: json['note'],
      cancelReason: json['cancelReason'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }

  @override
  List<Object?> get props => [
    apptId,
    patientId,
    clinicsSkdId,
    date,
    startTime,
    endTime,
    doctorName,
    hospitalName,
    departmentId,
    doctorImageUrl,
    doctorImageHash,
    apptState,
    report,
    patientComplaint,
    note,
    cancelReason,
    updatedAt,
    createdAt,
  ];
}
