// import 'dart:convert';
// import 'package:get_storage/get_storage.dart';
// import 'package:hospital/models/patient_model.dart';
// import 'package:http/http.dart' as http;
//
// class AllPatientServices {
//   static Future<PatientModel> carDetails() async {
//     var access_token = GetStorage().read("access_token");
//     print("===========access_token============");
//     print(access_token);
//     print("=======================");
//     var response = await http.post(Uri.parse("$baseUrl/ownerCars"), headers: {
//       "Accept": "application/json",
//       "Authorization": "Bearer " + access_token
//     });
//     if (response.statusCode == 200) {
//       return PatientModel.fromJson(jsonDecode(response.body));
//     } else {
//       return throw Exception("Error 500");
//     }
//   }
// }