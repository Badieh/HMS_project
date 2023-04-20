import 'package:equatable/equatable.dart';

class TopDoctorModel extends Equatable {
  final String name;
  final String specialty;
  final String imageUrl;
  final String hospitalName;
  final String National_ID_Card;
  final String Degree;
  final String Position;

  const TopDoctorModel({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.hospitalName,
    required this.National_ID_Card,
    required this.Degree,
    required this.Position,
  });

  factory TopDoctorModel.fromJson(Map<String, dynamic> json) {
    return TopDoctorModel(
      name: json['name'],
      specialty: json['specialty'],
      imageUrl: json['imageUrl'],
      hospitalName: json['hospitalName'],
      National_ID_Card: json['National_ID_Card'],
      Degree: json['Degree'],
      Position: json['Position'],
    );
  }

  @override
  List<Object> get props => [name, specialty, imageUrl, hospitalName, National_ID_Card, Degree,Position , ];
}
