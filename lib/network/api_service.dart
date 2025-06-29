import 'package:dio/dio.dart';
import 'package:news_app/model/artical.dart';
class ApiService {
 final Dio _dio = Dio();
  final _apiKey = "37052459a7644ced973fa1a8bb9e5e52";
  final String _baseUrl ="https://newsapi.org";
  Future<List<Article>> getNews()async{
   var response =await _dio.get("$_baseUrl/v2/top-headlines?country=us&category=business&apiKey=$_apiKey");
   var jsonData = response.data;
  List<Article> articals = [];
  for(var item in jsonData["articles"]){
   articals.add(
    Article(author: item["author"],title: item["title"],description: item["description"],image: item["urlToImage"],)
   );
  }
 return articals;
  }
}
