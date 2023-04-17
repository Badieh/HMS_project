import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/articleModel.dart';
import 'package:hospital/network/remote/dio_helper.dart';
import 'package:hospital/presentation/resources/constants_manager.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_states.dart';

class ArticlesCubit extends Cubit<ArticlesStates> {
  ArticlesCubit() : super(ArticlesInitialState());

  static ArticlesCubit get(context) => BlocProvider.of(context);

  List<ArticleModel> articles = [];
  void getArticles() async {
    if (articles.isEmpty) {
      emit(GetArticlesLoadingState());

      try {
        var response =
            await DioHelper.getData(url: AppConstants.articlesPath, query: {
          'country': AppConstants.country,
          'category': AppConstants.category,
          'apiKey': AppConstants.articlesApiKey,
        });
        //print(response.data['articles'][1]);
        articles = List.from(response.data['articles'])
            .map((e) => ArticleModel.fromJson(e))
            .toList();

        // print(articles[1]);

        emit(GetArticlesSuccessState());
      } catch (error) {
        print(error.toString());
        emit(GetArticlesErrorState(error.toString()));
      }
    } else {
      emit(GetArticlesSuccessState());
    }
  }
}
