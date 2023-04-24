import 'package:hospital/models/appointment_model.dart';
import 'package:hospital/models/case_diagnose_model.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/file_model.dart';
import 'package:hospital/models/doctor_model.dart';
import 'package:hospital/models/treatment_model.dart';

CaseDiagnose caseDiagnose1 = const CaseDiagnose(
    departmentName: 'Neurology',
    doctorName: 'Bisho',
    location: 'location',
    complaint: 'complaint',
    diagnosis: 'diagnosis',
    clinicalExamination: 'clinicalExamination',
    dateTime: '2022-04-14 15:30:00.000',
    notes: 'notes',
    departmentIconUrl:
        'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png',
    hospitalName: 'El72ona bgd Hospital',
    patientName: 'Michael');

Treatment treatment1 = const Treatment(
  doctor: 'Bisho',
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

DoctorModel Doctor1 = const DoctorModel(
  name: 'Dr. John Smith',
  specialty: 'Cardiologist',
  imageUrl:
      'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png',
  nationalIDCard: '555-1234',
  hospitalName: 'HMS Application',
  degree: 'D',
  position: 'Master',
  noOfPatient: "5500",
  yearsOfExperience: "5.5",
  aboutMe:
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
);
DoctorModel Doctor2 = const DoctorModel(
  name: 'Dr. Badeih Nader',
  specialty: 'Cardiologist',
  imageUrl:
      'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png',
  nationalIDCard: '555-1234',
  hospitalName: 'HMS Application',
  degree: 'D',
  position: 'Master',
  noOfPatient: "5500",
  yearsOfExperience: "5.5",
  aboutMe:
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
);
AppointmentModel appointment1 = const AppointmentModel(
  doctorName: 'Dr. John Smith',
  hospitalName: 'General Hospital',
  doctorImageUrl:
      'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png',
  date: '2023-05-01',
  startTime: '14:00',
  endTime: '15:00',
  department: 'neurology',
);

ClinicsScheduleModel clinicsScheduleModel_1 = const ClinicsScheduleModel(
  day: 1,
  startTime: "9:00 AM",
  endTime: "5:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);
ClinicsScheduleModel clinicsScheduleModel_2 = const ClinicsScheduleModel(
  day: 2,
  startTime: "5:00 pM",
  endTime: "10:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);
ClinicsScheduleModel clinicsScheduleModel_3 = const ClinicsScheduleModel(
  day: 3,
  startTime: "5:00 pM",
  endTime: "10:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);

ClinicsScheduleModel clinicsScheduleModel_4 = const ClinicsScheduleModel(
  day: 1,
  startTime: "12:00 AM",
  endTime: "3:00 PM",
  isAvailable: true,
  notes: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
);

