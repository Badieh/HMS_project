import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/clinics_schedule_model.dart';
import 'package:hospital/models/dummy_data.dart';
import 'package:hospital/presentation/screens/top_doctors/top_doctor_details_cubit/top_doctors_details_stats.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TopDoctorsDetailsCubit extends Cubit<TopDoctorsDetailsState> {
  TopDoctorsDetailsCubit() : super(TopDoctorsDetailsInitialState());

  static TopDoctorsDetailsCubit get(context) => BlocProvider.of(context);


  List<ClinicsScheduleModel> topDoctorsDetails = [];
  void getTopDoctorsDetails() async {
    if (topDoctorsDetails.isEmpty) {
      emit(GetTopDoctorsDetailsLoadingState());

      try {
      //   var response =
      //   await DioHelper.getData(url: AppConstants.articlesPath, query: {
      //     'country': AppConstants.country,
      //     'category': AppConstants.category,
      //     'apiKey': AppConstants.articlesApiKey,
      //   });
      //   //print(response.data['articles'][1]);
      //   topDoctorsDetails = List.from(response.data['topDoctorsDetails'])
      //       .map((e) => TopDoctorModel.fromJson(e))
      //       .toList();

        // print(articles[1]);
        topDoctorsDetails = [
          clinicsScheduleModel_1,
          clinicsScheduleModel_1,
          clinicsScheduleModel_1,
          clinicsScheduleModel_1,
        ];
        emit(GetTopDoctorsDetailsSuccessState());
      } catch (error) {
      //   print(error.toString());
      //   emit(GetTopDoctorsDetailsErrorState(error.toString()));
      }
    // } else {
      emit(GetTopDoctorsDetailsSuccessState());
    }
  }
  // emit the new list of doctors to the UI
  emit(topDoctorsDetails);
//
//   List<Employee> employees = <Employee>[];
//
//   late EmployeeDataSource employeeDataSource;
//
//     employees= getEmployees();
//     employeeDataSource = EmployeeDataSource(employees: employees);
//
//
//   List<Employee> getEmployees() {
//     return[
//       Employee(10001, 'James', 'Project Lead', 20000),
//       Employee(10002, 'Kathryn', 'Manager', 30000),
//       Employee(10003, 'Lara', 'Developer', 15000),
//       Employee(10004, 'Michael', 'Designer', 15000),
//       Employee(10005, 'Martin', 'Developer', 15000),
//       Employee(10006, 'Newberry', 'Developer', 15000),
//       Employee(10007, 'Balnc', 'Developer', 15000),
//       Employee(10008, 'Perry', 'Developer', 15000),
//       Employee(10009, 'Gable', 'Developer', 15000),
//       Employee(10010, 'Grimes', 'Developer', 15000)
//     ];
//   }
//
// }class Employee {
//   Employee(this.id, this.name, this.designation, this.salary);
//   final int id;
//   final String name;
//   final String designation;
//   final int salary;
// }class EmployeeDataSource extends DataGridSource {
//   EmployeeDataSource({required List<Employee> employees}) {
//     _employees = employees
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//       DataGridCell<int>(columnName: 'id', value: e.id),
//       DataGridCell<String>(columnName: 'name', value: e.name),
//       DataGridCell<String>(
//           columnName: 'designation', value: e.designation),
//       DataGridCell<int>(columnName: 'salary', value: e.salary),
//     ])).toList();
//   }
//
//   List<DataGridRow>  _employees = [];
//
//   @override
//   List<DataGridRow> get rows =>  _employees;
//
//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((dataGridCell) {
//           return Container(
//             alignment: (dataGridCell.columnName == 'id' || dataGridCell.columnName == 'salary')
//                 ? Alignment.centerRight
//                 : Alignment.centerLeft,
//             padding: EdgeInsets.all(16.0),
//             child: Text(dataGridCell.value.toString()),
//           );
//         }).toList());
//   }
}