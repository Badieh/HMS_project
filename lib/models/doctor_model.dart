
class DoctorModel {
  final int id;
  final String name;
  final String specialty;
  final String imageUrl;
  final String imageHash;
  final String hospitalName;
  final String nationalIDCard;
  final int degree;
  final int position;
  final String? notes;
  final int? noOfPatient;
  final double yearsOfExperience;
  final String aboutMe;

  DoctorModel({
    required this.name,
    required this.id,
    required this.specialty,
    required this.imageUrl,
    this.imageHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
    required this.hospitalName,
    required this.nationalIDCard,
    required this.degree,
    required this.position,
    this.notes,
    this.noOfPatient,
    required this.yearsOfExperience,
    required this.aboutMe,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      id: json['id'],
      specialty: json['specialty'],
      imageUrl: json['imageUrl'],
      imageHash: json['imageHash'],
      hospitalName: json['hospitalName'],
      nationalIDCard: json['National_ID_Card'],
      degree: json['degree'],
      position: json['position'],
      notes: json['notes'],
      noOfPatient: json['noOfPatient'],
      yearsOfExperience: json['yearsOfExperience'],
      aboutMe: json['aboutMe'],
    );
  }
}
