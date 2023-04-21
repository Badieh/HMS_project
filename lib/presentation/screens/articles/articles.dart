import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/models/article_model.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_cubit.dart';
import 'package:hospital/presentation/screens/articles/cubit/articles_states.dart';
import 'package:hospital/presentation/screens/articles/webview.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return BlocConsumer<ArticlesCubit, ArticlesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles = ArticlesCubit.get(context).articles;
        return buildListOfArticles(
            height: height, width: width, articles: articles);
      },
    );
  }

  Widget buildArticleCard(
      {required double height,
      required double width,
      required ArticleModel article,
      required context}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewExample(url: article.url),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: width * 0.2,
                height: height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // image: DecorationImage(
                  //     image: article.urlToImage != null
                  //         ? NetworkImage(
                  //             '${article.urlToImage}',
                  //           )
                  //         : const AssetImage(
                  //             ImageAssets.imageNotFound,
                  //           ) as ImageProvider,
                  //     onError: (exception, stackTrace) {
                  //       // Display a fallback image or an error message
                  //       return;
                  //     },
                  //     fit: BoxFit.cover),
                ),
                child: flutter_blurhash.BlurHash(
                  image: article.urlToImage,
                  hash: article.imageHash,
                  duration: const Duration(milliseconds: 500),
                  imageFit: BoxFit.cover,
                )),
            SizedBox(
              width: width * 0.07,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
                height: height * 0.11,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Text(
                        article.publishedAt,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.03,
                            color: Colors.grey),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListOfArticles(
          {required double height,
          required double width,
          required List<ArticleModel> articles,
          isSearch = false}) =>
      ConditionalBuilder(
          condition: articles.isNotEmpty,
          builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleCard(
                  height: height,
                  width: width,
                  article: articles[index],
                  context: context),
              separatorBuilder: (context, index) => separator(),
              itemCount: 10),
          fallback: (context) => isSearch
              ? Container(
                  child: Center(
                      child: Text(
                    'Developed by Badieh Nader',
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                )
              : Center(child: CircularProgressIndicator()));
}
