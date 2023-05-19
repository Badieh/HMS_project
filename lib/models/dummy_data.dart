import 'package:hospital/models/appointment_model.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/file_model.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/models/patient_model.dart';
import 'package:hospital/models/treatment_model.dart';

CaseDiagnose caseDiagnose1 = const CaseDiagnose(
    departmentName: 'Neurology',
    doctorName: 'Bishoy Shehata Morris',
    location: '8 fouad street Alexandria',
    complaint: 'complaint',
    diagnosis: 'diagnosis',
    clinicalExamination: 'clinicalExamination',
    dateTime: '2022-04-14 15:30:00.000',
    notes: 'notes',
    departmentIconUrl:
        'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png',
    hospitalName: hospitalName,
    patientName: 'Michael Emad Ramzy');

Treatment treatment1 = const Treatment(
  doctor: 'Bishoy Shehata Morris',
  treatmentName: 'Congestal',
  instructions: 'Take 1 bill after each meal for 30 days',
  dose: '3',
  startDate: '2022-04-14',
  endDate: '2022-05-14',
  departmentIconUrl:
      'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png',
);

FileModel file1 = const FileModel(
    fileName: 'fluter',
    fileUrl:
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf');
DoctorModel Doctor1 = DoctorModel(
  userId: 125,
  doctorId: 1,
  firstName: 'john',
  secondName: 'lamei',
  thirdName: 'tawfik',
  lastName: 'salah',
  fullName: 'john lamei tawfik salah',
  specialty: 4,
  imageUrl:
      'https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png',
  nationalId: '555-1234',
  hospitalName: hospitalName,
  degree: 1,
  position: 1,
  noOfPatients: 5500,
  yearsOfExperience: 5.5,
  aboutMe:
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
);
DoctorModel Doctor2 = DoctorModel(
  userId: 126,
  doctorId: 2,
  firstName: 'bishoy',
  secondName: 'shehata',
  thirdName: 'tawfik',
  lastName: 'salah',
  fullName: 'bishoy shehata tawfik salah',
  specialty: 9,
  imageUrl:
      'https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png',
  nationalId: '555-1234',
  hospitalName: hospitalName,
  degree: 1,
  position: 1,
  noOfPatients: 5500,
  yearsOfExperience: 5.5,
  aboutMe:
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
);

AppointmentModel appointment1 = const AppointmentModel(
  id: 1,
  doctorName: 'Dr. John Smith',
  hospitalName: hospitalName,
  doctorImageUrl:
      'https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png',
  date: '2023-05-01',
  startTime: '14:00',
  endTime: '15:00',
  department: 'neurology',
);

ClinicsScheduleModel clinicsScheduleModel_1 = const ClinicsScheduleModel(
  clinicScheduleId: 1,
  day: 1,
  startTime: "9:00 AM",
  endTime: "5:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);
ClinicsScheduleModel clinicsScheduleModel_2 = const ClinicsScheduleModel(
  day: 2,
  clinicScheduleId: 2,
  startTime: "5:00 pM",
  endTime: "10:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);
ClinicsScheduleModel clinicsScheduleModel_3 = const ClinicsScheduleModel(
  day: 3,
  clinicScheduleId: 3,
  startTime: "5:00 pM",
  endTime: "10:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);

ClinicsScheduleModel clinicsScheduleModel_4 = const ClinicsScheduleModel(
  day: 1,
  clinicScheduleId: 4,
  startTime: "12:00 AM",
  endTime: "3:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);

const String hospitalName = 'General Hospital';

const imageHashdummy = 'L5H2EC=PM+yV0g-mq.wG9c010J}I';

PatientModel patientModel1 = PatientModel(
    patientData: PatientData(
        userId: 0,
        nationalId: "nationalId",
        firstName: "John",
        secondName: "Shehata",
        thirdName: "Morris",
        lastName: "lastName",
        fullName: "John Shehata Morris El-Sayeh",
        address: "8 SidiBeshr Street Alexandria-Egypt",
        bloodType: 2,
        religion: 0,
        birthDate: DateTime.parse("2000-12-09"),
        gender: 1,
        nationality: "Egyptian",
        country: "Egypt",
        state: "Alexandria",
        street: "El_Teen",
        buildingNumber: 8,
        appartment: 4,
        phoneNumber: "01220709149",
        height: 180,
        weight: 102,
        age: 23,
        patientPP:
            "https://as2.ftcdn.net/v2/jpg/03/20/52/31/1000_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
        patientPPHash: imageHashdummy,



    ),
    statusCode: 200,
    message: "");
PatientModel patientModel2 = PatientModel(
    patientData: PatientData(
        userId: 0,
        nationalId: "nationalId",
        firstName: "Bishoy",
        secondName: "Shehata",
        thirdName: "Morris",
        lastName: "lastName",
        fullName: "Bishoy Shehata Morris El-Sayeh",
        address: "8 El-Zhoor Street Alexandria-Egypt",
        bloodType: 2,
        religion: 0,
        birthDate: DateTime.parse("2000-12-09"),
        gender: 1,
        nationality: "Egyptian",
        country: "Egypt",
        state: "Alexandria",
        street: "El_Teen",
        buildingNumber: 8,
        appartment: 4,
        phoneNumber: "01220709149",
        height: 180,
        weight: 102,
        age: 23,
        patientPP:
            "https://as2.ftcdn.net/v2/jpg/03/20/52/31/1000_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
        patientPPHash: imageHashdummy,



    ),
    statusCode: 200,
    message: "");
