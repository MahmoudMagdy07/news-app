import 'package:news_app/model/artical.dart';

import 'news_app/model/article.dart';


abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<Article> articles;
  final String selectedCategory;

  NewsSuccess({
    required this.articles,
    required this.selectedCategory,
  });
}

class NewsError extends NewsState {
  final String errorMessage;
  NewsError(this.errorMessage);
}