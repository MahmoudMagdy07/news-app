import 'package:flutter/material.dart';
import 'package:news_app/model/catogery.dart';
import 'package:news_app/widgets/news_catogery_item.dart';
class CatogeryListview extends StatelessWidget {
  const CatogeryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal ,
        itemBuilder: (context,index){
          return CategoryItem(catogery: NewsCatogery[index]);
        },
        itemCount: NewsCatogery.length,),
    );
  }
}
