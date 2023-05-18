import 'dummy_data.dart';

class DoctorsListOfModels {
  final List<DoctorModel> doctors;
  final int statusCode;
  final String message;

  DoctorsListOfModels(
      {required this.doctors, required this.statusCode, required this.message});

  factory DoctorsListOfModels.fromJson(Map<String, dynamic> json) {
    List<DoctorModel> doctorList = [];
    if (json['doctors'] != null) {
      var doctorsJson = json['doctors'] as List;
      doctorList = doctorsJson
          .map((doctorJson) => DoctorModel.fromJson(doctorJson))
          .toList();
    }
    return DoctorsListOfModels(
      doctors: doctorList,
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }
}

class DoctorModel {
  final int doctorId;
  final int userId;
  final String nationalId;
  final String? fullName;
  final String firstName;
  final String secondName;
  final String thirdName;
  final String lastName;
  final int degree;
  final int position;
  final int specialty;
  final String? hospitalName;
  final String? imageUrl;
  final String? imageHash;
  final int? noOfPatients;
  final double yearsOfExperience;
  final String? aboutMe;
  final String? note;
  final String? createdAt;
  final String? updatedAt;

  DoctorModel({
    required this.doctorId,
    required this.userId,
    required this.nationalId,
    this.fullName,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.lastName,
    required this.degree,
    required this.position,
    required this.specialty,
    this.hospitalName,
    this.imageUrl,
    this.imageHash = imageHashdummy,
    this.noOfPatients,
    required this.yearsOfExperience,
    this.aboutMe,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctorId'],
      userId: json['userId'],
      nationalId: json['nationalId'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      thirdName: json['thirdName'],
      lastName: json['lastName'],
      degree: json['degree'],
      position: json['position'],
      specialty: json['departmentId'],
      hospitalName: json['hospitalName'],
      imageUrl: json['imageUrl'],
      imageHash: json['imageHash'],
      noOfPatients: json['noOfPatients'],
      yearsOfExperience: json['yearsOfExperience'].toDouble(),
      aboutMe: json['aboutMe'],
      note: json['note'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
