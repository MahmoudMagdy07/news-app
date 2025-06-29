import 'package:flutter/material.dart';
import 'package:news_app/model/catogery.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.catogery});
  final Catogery catogery;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundImage: NetworkImage(
          catogery.image,
      ),
      radius: 65,
      child: Text(
      catogery.name,
        style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
      ),
    );
  }
}
