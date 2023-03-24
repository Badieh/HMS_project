import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/style_manager.dart';

import 'font_manager.dart';
import 'values_manager.dart';

ThemeData getThemeData() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    // cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            shadowColor: ColorManager.grey1,
            backgroundColor: ColorManager.primary,
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17))),

    // text theme
    textTheme: TextTheme(
        displayLarge:
            getLightStyle(color: ColorManager.grey1, fontSize: FontSize.s22),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        titleLarge: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),
        bodySmall: getRegularStyle(color: ColorManager.grey)),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[150],
      filled: true,
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),

      // label style
      labelStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),

      // error style
      errorStyle:
          getRegularStyle(color: ColorManager.error, fontSize: FontSize.s14),

      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      // focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}

ThemeData getDarkThemeData() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey,

    // cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // text theme

    // appbar theme

    //button theme

    // input decoration theme
  );
}
