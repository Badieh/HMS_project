import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class DarkModeController extends GetxController {
  var switchValue = false.obs;
  final GetStorage themeStorage = GetStorage();
  final darkThemeKey = "isDark";


  saveThemeDataInBox(bool isDark){
    themeStorage.write(darkThemeKey, isDark);
    // themeStorage.write("isSwitched", switchValue);
    //  bool savedSwitchValue = themeStorage.read('switchValue') ?? false;
  }
 bool getThemeDataFromBox(){
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
   return getThemeDataFromBox() ? ThemeMode.dark:ThemeMode.light;

  }

  void changeTheme(){
   Get.changeThemeMode(getThemeDataFromBox() ? ThemeMode.light:ThemeMode.dark );
   saveThemeDataInBox(!getThemeDataFromBox());
  }

}