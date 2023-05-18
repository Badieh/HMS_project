class PatientModel {
  final PatientData patientData;
  final int statusCode;
  final String message;

  PatientModel({
    required this.patientData,
    required this.statusCode,
    required this.message,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
        patientData: PatientData.fromJson(json['patient']),
        statusCode: json['statusCode'],
        message: json['message']);
  }
}

class PatientData {
  final int? patientId;
  final int userId;
  final String nationalId;
  final String? fullName;
  final String firstName;
  final String secondName;
  final String thirdName;
  final String lastName;
  final DateTime birthDate;
  final int? age;
  final int? religion;
  final int gender;
  final int? maritalStatus;
  final String nationality;
  final int? bloodType;
  final String? address;
  final String country;
  final String state;
  final String? city;
  final String street;
  final int buildingNumber;
  final int appartment;
  final String? birthPlace;
  final String? birthCountry;
  final String? birthState;
  final String? birthCity;
  final String phoneNumber;
  final double height;
  final double weight;
  final String? job;
  final String? jobAddress;
  final String? jobCountry;
  final String? jobState;
  final String? jobCity;
  final String? note;
  final String? createdAt;
  final String? updatedAt;
  final String? patientPP;
  final String? patientPPHash;

  const PatientData({
    this.patientId,
    required this.userId,
    required this.nationalId,
    this.fullName,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.lastName,
    required this.birthDate,
    this.age,
    this.religion,
    required this.gender,
    this.maritalStatus,
    required this.nationality,
    this.bloodType,
    this.address,
    required this.country,
    required this.state,
    this.city,
    required this.street,
    required this.buildingNumber,
    required this.appartment,
    this.birthPlace,
    this.birthCountry,
    this.birthState,
    this.birthCity,
    required this.phoneNumber,
    required this.height,
    required this.weight,
    this.job,
    this.jobAddress,
    this.jobCountry,
    this.jobState,
    this.jobCity,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.patientPP,
    this.patientPPHash,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) {
    return PatientData(
      patientId: json['patientId'],
      userId: json['userId'],
      nationalId: json['nationalId'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      thirdName: json['thirdName'],
      lastName: json['lastName'],
      birthDate: DateTime.parse(json['birthDate']),
      age: json['age'],
      religion: json['religion'],
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      nationality: json['nationality'],
      bloodType: json['bloodType'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      street: json['street'],
      buildingNumber: json['buildingNumber'],
      appartment: json['appartment'],
      birthPlace: json['birthPlace'],
      birthCountry: json['birthCountry'],
      birthState: json['birthState'],
      birthCity: json['birthCity'],
      phoneNumber: json['phoneNumber'],
      height:  json['height'].toDouble(),
      weight: json['weight'].toDouble(),
      job: json['job'],
      jobAddress: json['jobAddress'],
      jobCountry: json['jobCountry'],
      jobState: json['jobState'],
      jobCity: json['jobCity'],
      note: json['note'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      patientPP: json['patientPP'],
      patientPPHash: json['patientPPHash'],
    );
  }
}
