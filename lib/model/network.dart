import 'package:dio/dio.dart';
import 'package:news_app/model/artical.dart';
import 'package:news_app/model/article.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _apiKey = "022013a4946d4d7684285374fde847b6";
  final String _baseUrl = "https://newsapi.org";

  Future<List<Article>> getNews([String category = "general"]) async {
    try {
      final response = await _dio.get(
        "$_baseUrl/v2/top-headlines",
        queryParameters: {
          "country": "us",
          "category": category.toLowerCase(),
          "apiKey": _apiKey,
        },
      );

      final jsonData = response.data;
      List<Article> articles = [];

      for (var item in jsonData["articles"]) {
        articles.add(
          Article(
            author: item["author"] ?? "Unknown",
            title: item["title"] ?? "No Title",
            image: item["urlToImage"] ?? "https://via.placeholder.com/300x200",
            description: item["description"] ?? "",
          ),
        );
      }

      return articles;
    } catch (e) {
      throw Exception("Failed to fetch news: $e");
    }
  }
}