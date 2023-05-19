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
AppointmentModel appointment1 = AppointmentModel(
  apptId: 21,
  patientId: 23,
  clinicsSkdId: 27,
  date: "2023-05-17T22:00:00.000Z",
  startTime: "14:55:44",
  endTime: "25:55:44",
  doctorName: "Dr.Wilbert Abrams",
  hospitalName: "General Hospital",
  departmentId: 5,
  doctorImageUrl:
      "https://media.istockphoto.com/id/1425458510/photo/happy-medical-doctor-black-man-smile-and-healthcare-professional-experience-hospital-career.jpg?s=612x612&w=0&k=20&c=-H71rgH03EyrnCXM4VnQixIlyAHcLpPtOrrQSC31Lws=",
  doctorImageHash: null,
  apptState: "upcoming",
  report: null,
  patientComplaint: "ta3ban ya captain",
  note: null,
  cancelReason: null,
  updatedAt: "2023-05-19T12:09:04.433Z",
  createdAt: "2023-05-19T12:09:04.433Z",
);
AppointmentModel appointment2 = AppointmentModel(
  apptId: 42,
  patientId: 35,
  clinicsSkdId: 48,
  date: "2023-05-20T22:00:00.000Z",
  startTime: "09:30:00",
  endTime: "10:15:00",
  doctorName: "Dr. Emily Thompson",
  hospitalName: "City Medical Center",
  departmentId: 8,
  doctorImageUrl: "https://example.com/doctor2.jpg",
  doctorImageHash: "abc123",
  apptState: "scheduled",
  report: null,
  patientComplaint: "I have been experiencing back pain.",
  note: null,
  cancelReason: null,
  updatedAt: "2023-05-19T15:25:10.123Z",
  createdAt: "2023-05-19T15:25:10.123Z",
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
        firstName: "Bishoy",
        secondName: "Shehata",
        thirdName: "Morris",
        lastName: "lastName",
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
        patientPPHash: imageHashdummy),
    statusCode: 200,
    message: "");
