import 'package:hospital/models/dummy_data.dart';

class AppointmentsListofModels {
  final List<AppointmentModel> appointmentModels;
  final int statusCode;
  final String message;

  AppointmentsListofModels(
      {required this.appointmentModels,
      required this.statusCode,
      required this.message});

  factory AppointmentsListofModels.fromJson(Map<String, dynamic> json) {
    List<AppointmentModel> appointmentModels = [];
    if (json['appointments'] != null) {
      var appointmentModelsJson = json['appointments'] as List;
      appointmentModels = appointmentModelsJson
          .map((appointmentModelsJson) =>
              AppointmentModel.fromJson(appointmentModelsJson))
          .toList();
    }
    return AppointmentsListofModels(
      appointmentModels: appointmentModels,
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}

class AppointmentModel {
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
  final String? patientComplaint;
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
    this.doctorImageHash = imageHashdummy,
    required this.apptState,
    this.report,
    this.patientComplaint,
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
}
