import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_cubit.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_states.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return BlocProvider(
      create: (context) => ArticlesCubit()..getArticles(),
      child: BlocConsumer<ArticlesCubit, ArticlesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var articles = ArticlesCubit.get(context).articles;
          return Scaffold(
            body: buildListOfArticles(
                height: height, width: width, articles: articles),
          );
        },
      ),
    );
  }
}
