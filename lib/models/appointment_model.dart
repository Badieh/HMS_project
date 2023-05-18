import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
  final int id;
  final String hospitalName;
  final String doctorName;
  final String department;
  final String doctorImageUrl;
  final String? doctorImageHash;
  final String date;
  final String startTime;
  final String endTime;

  const AppointmentModel(
      {required this.doctorName,
      required this.id,
      required this.hospitalName,
      required this.department,
      required this.doctorImageUrl,
      this.doctorImageHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
      required this.date,
      required this.startTime,
      required this.endTime});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      doctorName: json['doctorName'],
      hospitalName: json['hospitalName'],
      department: json['department'],
      doctorImageUrl: json['doctorImageUrl'],
      doctorImageHash: json['doctorImageHash'],
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
        doctorImageUrl,
        date,
        startTime,
        endTime,
      ];
}
