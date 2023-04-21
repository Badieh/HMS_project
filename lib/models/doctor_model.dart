import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  final String name;
  final String specialty;
  final String imageUrl;
  final String imageHash;
  final String hospitalName;
  final String nationalIDCard;
  final String degree;
  final String position;
  final String? notes;

  const DoctorModel({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    this.imageHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
    required this.hospitalName,
    required this.nationalIDCard,
    required this.degree,
    required this.position,
    this.notes,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      specialty: json['specialty'],
      imageUrl: json['imageUrl'],
      imageHash: json['imageHash'],
      hospitalName: json['hospitalName'],
      nationalIDCard: json['National_ID_Card'],
      degree: json['Degree'],
      position: json['Position'],
      notes: json['notes'],
    );
  }

  @override
  List<Object> get props => [
        name,
        specialty,
        imageUrl,
        imageHash,
        hospitalName,
        nationalIDCard,
        degree,
        position,
      ];
}
