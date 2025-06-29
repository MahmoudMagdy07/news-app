import 'package:flutter/material.dart';
import 'package:news_app/model/artical.dart';
import 'package:news_app/network/api_service.dart';
import 'package:news_app/widgets/artical_item.dart';
 class ArticleListview extends StatefulWidget {
   const ArticleListview({super.key});

   @override
   State<ArticleListview> createState() => _ArticleListviewState();
 }

 class _ArticleListviewState extends State<ArticleListview> {
  List<Article>? finalList ;
   @override
   void initState(){
      getNews();
     // TODO: implement initState
     super.initState();
   }
   getNews()async{
     ApiService apiService = ApiService();
     finalList =await apiService.getNews();
     setState(() {

     });
   }
   @override
   Widget build(BuildContext context) {

     return finalList==null ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
         :SliverList.builder(itemBuilder: (context,index){
           return ArticleItem(article: finalList![index],);
     },itemCount: finalList!.length);


   }


 }
