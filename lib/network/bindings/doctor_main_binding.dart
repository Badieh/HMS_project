
import 'package:get/get.dart';
import 'package:hospital/network/controller/dark_mode_controller.dart';
import 'package:hospital/network/controller/doctor_main_controller.dart';

class DoctorMainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(DoctorMainController());

  }

}