import 'package:hospital/models/caseDiagnoseModel.dart';
import 'package:hospital/models/treatmentModel.dart';

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
