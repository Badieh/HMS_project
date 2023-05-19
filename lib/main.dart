import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital/network/controller/dark_mode_controller.dart';
import 'package:hospital/network/remote/cache_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/theme_manager.dart';
import 'package:hospital/presentation/screens/appointments/cubit/appointment_cubit.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_cubit.dart';
import 'package:hospital/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:hospital/presentation/screens/book_appointments/cubit/book_appointment_cubit.dart';
import 'package:hospital/presentation/screens/doctors/cubit/doctors_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';
import 'package:hospital/presentation/screens/routes/routes.dart';
import 'package:hospital/presentation/screens/specializations/cubit/specializations_cubit.dart';
import 'network/remote/dio_helper.dart';
import 'presentation/screens/layout/layout_cubit/main_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // Initialize articles baseurl
  await DioHelper.init(AppConstants.articlesBaseUrl);
  await DioHelper.init(AppConstants.backendBaseUrl);
  // check to see if It is the first time to open the app
  // to set default value of is logged = false
  // AppConstants.adminStorage.write('isLogged', false);

  if (AppConstants.adminStorage.read('isLogged') == null) {
    AppConstants.adminStorage.write('isLogged', false);
  }
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
          create: (context) => MainCubit(context),
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
        // Doctors
        BlocProvider(create: (context) => DoctorsCubit()),
        // Profile Data Cubit
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        // book appointment
        BlocProvider(
          create: (context) =>
              BookAppointmentCubit()..getTimesOfDay(date: DateTime.now()),
        ),

        // Specializations
        BlocProvider(
          create: (context) => SpecializationsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'HMS App',
            theme: getLightThemeData(),
            darkTheme: getDarkThemeData(),
            themeMode: DarkModeController().ThemeDataGet,
            initialRoute: AppRoutes.doctorHomeScreen,
            getPages: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
// BookAppointment(
// title: 'Book Appointment',
// clinicsScheduleList: [
// clinicsScheduleModel_1,
// clinicsScheduleModel_4,
// clinicsScheduleModel_1,
// clinicsScheduleModel_2,
// clinicsScheduleModel_4,
// clinicsScheduleModel_3,
// clinicsScheduleModel_1,
// ])
