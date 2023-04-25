import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/network/remote/cache_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/theme_manager.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_cubit.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/layout/layout.dart';
import 'network/remote/dio_helper.dart';
import 'presentation/screens/layout/layout_cubit/main_cubit.dart';
import 'presentation/screens/top_doctors/cubit/top_doctors_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // Initialize articles baseurl
  await DioHelper.init(AppConstants.articlesBaseUrl);
  // Initialize Main baseurl
  //await DioHelper.init(AppConstants.mainBaseUrl);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // layout
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        // articles
        BlocProvider(
          create: (context) => ArticlesCubit()..getArticles(),
        ),
        // history
        BlocProvider(
          create: (context) => HistoryCubit()
            ..getDiagnosisList()
            ..getTreatmentList()
            ..getFilesList(),
        ),
        // appointments
        BlocProvider(
          create: (context) => AppointmentsCubit()
            ..getUpcomingAppointmentsList()
            ..getCompletedAppointmentsList()
            ..getCancelledAppointmentsList(),
        ),
        // TopDoctors
        BlocProvider(create: (context) => TopDoctorsCubit()..getTopDoctors()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'HMS App',
            theme: getThemeData(),
            home: HomeLayoutScreen(),
          );
        },
      ),
    );
  }
}
