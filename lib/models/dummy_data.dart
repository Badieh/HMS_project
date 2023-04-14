import 'package:hospital/models/caseDiagnoseModel.dart';
import 'package:hospital/models/treatmentModel.dart';

CaseDiagnose caseDiagnose1 = const CaseDiagnose(
    department: 'Neurology',
    doctor: 'Dr.Bisho',
    location: 'location',
    complaint: 'complaint',
    diagnosis: 'diagnosis',
    clinicalExamination: 'clinicalExamination',
    dateTime: '2022-04-14 15:30:00.000',
    notes: 'notes',
    departmentIconUrl:
        'https://com-neurology-a2.sites.medinfo.ufl.edu/files/2011/08/gator-color-brain.png');

Treatment treatment1 = const Treatment(
    doctor: 'dr.Bisho',
    treatmentName: 'Congestal',
    instructions: 'Take 1 bill after each meal for 30 days',
    notes: 'notes',
    dose: '3',
    startDate: '2022-04-14',
    endDate: '2022-05-14');
