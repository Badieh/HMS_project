import 'package:equatable/equatable.dart';

class Treatment extends Equatable {
  final String treatmentName;
  final String departmentIconUrl;
  final String departmentIconHash;
  final String doctor;
  final String instructions;
  final String? notes;
  final String dose;
  final String startDate;
  final String endDate;

  const Treatment(
      {required this.treatmentName,
      required this.doctor,
      required this.instructions,
      this.notes,
      required this.dose,
      required this.startDate,
      required this.endDate,
      required this.departmentIconUrl,
      this.departmentIconHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I'});

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
        treatmentName: json['treatmentName'],
        doctor: json['doctor'],
        instructions: json['instructions'],
        dose: json['dose'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        notes: json['notes'],
        departmentIconUrl: json['departmentIconeUrl']);
  }

  @override
  List<Object> get props =>
      [treatmentName, instructions, dose, startDate, endDate, doctor];
}
