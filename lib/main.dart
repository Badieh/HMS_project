import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/presentation/resources/theme_manager.dart';
import 'package:hospital/presentation/screens/layout/fill_profile.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';

import 'presentation/screens/top_doctors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HMS App',
          theme: getThemeData(),
          home:  Home_Layout_Screen(),
        );
      },
    );
  }
}
