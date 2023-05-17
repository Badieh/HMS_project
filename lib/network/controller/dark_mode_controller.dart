import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital/models/error_model.dart';
import 'package:hospital/network/remote/cache_helper.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:quickalert/quickalert.dart';

class DarkModeController extends GetxController {
  var switchValue = false.obs;
  final GetStorage themeStorage = GetStorage();
  final darkThemeKey = "isDark";

  saveThemeDataInBox(bool isDark) {
    themeStorage.write(darkThemeKey, isDark);
    // themeStorage.write("isSwitched", switchValue);
    //  bool savedSwitchValue = themeStorage.read('switchValue') ?? false;
  }

  bool getThemeDataFromBox() {
    return themeStorage.read<bool>(darkThemeKey) ?? false;
  }

  // saveSwitchValueInBox(bool isSwitched){
  //   themeStorage.write("isSwitched", isSwitched);
  // }
  // bool getSwitchValueFromBox(){
  //   return themeStorage.read("isSwitched") ?? false;
  //
  // }
  ThemeMode get ThemeDataGet {
    return getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }

  ErrorModel? errorModel;
  Future<void> logout() async {
    print(AppConstants.adminStorage.read('refreshToken'));
    try {
      // get data from API
      var response =
          await DioHelper.postData(url: AppConstants.logoutPath, data: {
        'refreshToken': AppConstants.adminStorage.read('refreshToken'),
      });

      // Removing Access token / Refresh token / user Id / PatientId / Doctor ID
      AppConstants.adminStorage.write('isLogged', false);
      AppConstants.adminStorage.remove('accessToken');
      AppConstants.adminStorage.remove('refreshsToken');
      AppConstants.adminStorage.remove('userId');

      Get.offAllNamed(Routes.login);
      snackbar(message: response.data['message'], isSuccess: true);
    } on DioError catch (error) {
      errorModel = ErrorModel.fromJson(json: error.response?.data);
      if (kDebugMode) {
        print(error.toString());
        print('Error code :${errorModel?.statusCode}');
        print('Error Message :${errorModel?.message}');
      }
      snackbar(message: errorModel!.message, isSuccess: true);
    }
  }
}
