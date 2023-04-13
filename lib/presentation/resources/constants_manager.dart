import 'package:bloc/bloc.dart';
import 'package:hospital/network/remote/cache_helper.dart';

class AppConstants {
  static const splashDelay = 3;
  static const sliderAnimationTime = 1;
  static const obBoardingSlides = 3;

  // https://newsapi.org/v2/top-headlines?
  // https://newsapi.org/
// v2/top-headlines?
// country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// my apikey : 97a2f0178be846b897d27b8f38d8571c
  static const articlesBaseUrl = 'https://newsapi.org/';
  static const articlesPath = '${articlesBaseUrl}v2/top-headlines';
  static const country ='us';
  static const category ='health';
  static const articlesApiKey = '97a2f0178be846b897d27b8f38d8571c';

  static const mainBaseUrl = '';
  static const mainApiKey = '';
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

String? token = (CacheHelper.getData(key: 'token'));
