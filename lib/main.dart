import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/network/remote/cache_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/resources/theme_manager.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_cubit.dart';
import 'package:hospital/presentation/screens/history/cubit/history_cubit.dart';

import 'network/remote/dio_helper.dart';
import 'presentation/screens/history/history.dart';

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
        BlocProvider(
          create: (context) => ArticlesCubit()..getArticles(),
        ),
        BlocProvider(
          create: (context) => HistoryCubit()
            ..getDiagnosisList()
            ..getTreatmentList(),
        ),
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
            home: HistoryScreen(),
          );
        },
      ),
    );
  }
}
