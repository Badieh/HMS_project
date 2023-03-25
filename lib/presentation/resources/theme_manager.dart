import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/style_manager.dart';

import 'font_manager.dart';
import 'values_manager.dart';

ThemeData getThemeData() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,

    disabledColor: ColorManager.grey,
    splashColor: ColorManager.secondary,
    scaffoldBackgroundColor: ColorManager.white,
    // appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s0,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),

    // cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.secondary,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(AppSize.sMaxInfinite, AppSize.s60),
            foregroundColor: ColorManager.white,
            backgroundColor: ColorManager.primary,
            shadowColor: ColorManager.grey,
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16, horizontal: AppPadding.p24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s30),
            ),
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s18))),

    // text theme
    textTheme: TextTheme(
        displayLarge:
            getBoldStyle(color: ColorManager.black, fontSize: FontSize.s35),
        headlineLarge:
            getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
        titleLarge:
            getMediumStyle(color: ColorManager.black, fontSize: FontSize.s25),
        bodyLarge:
            getRegularStyle(color: ColorManager.black, fontSize: FontSize.s18),
        bodySmall:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s16)),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.veryLightGrey,
      filled: true,
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle:
          getRegularStyle(fontSize: FontSize.s18, color: ColorManager.grey),

      // label style
      labelStyle:
          getRegularStyle(fontSize: FontSize.s18, color: ColorManager.grey),

      // error style
      errorStyle:
          getRegularStyle(color: ColorManager.error, fontSize: FontSize.s14),

      // enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      // focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      // focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),

    checkboxTheme: CheckboxThemeData(shape: const StadiumBorder(),
        //checkColor: MaterialStateProperty.all(ColorManager.primary),
        fillColor: MaterialStateProperty.all(ColorManager.primary),
        ),
  );
}

ThemeData getDarkThemeData() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
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
