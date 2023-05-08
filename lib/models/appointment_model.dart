import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final int id;
  final String hospitalName;
  final String doctorName;
  final String department;
  final String departmentImageUrl;
  final String? departmentImageHash;
  final String date;
  final String startTime;
  final String endTime;

  const AppointmentModel(
      {required this.doctorName,
      required this.id,
      required this.hospitalName,
      required this.department,
      required this.departmentImageUrl,
      this.departmentImageHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
      required this.date,
      required this.startTime,
      required this.endTime});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      doctorName: json['doctorName'],
      hospitalName: json['hospitalName'],
      department: json['department'],
      departmentImageUrl: json['doctorImageUrl'],
      departmentImageHash: json['doctorImageHash'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      id: json['id'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        doctorName,
        hospitalName,
        department,
        departmentImageUrl,
        date,
        startTime,
        endTime,
      ];
}
