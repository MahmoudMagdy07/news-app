import 'package:flutter/material.dart';
import 'package:news_app/model/artical.dart';

class ArticleItem extends StatefulWidget {
  ArticleItem({super.key, required this.article});
  final Article article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  widget.article.image ??
                      "https://images.pexels.com/photos/47356/freerider-skiing-ski-sports-47356.jpeg",
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              widget.article.description ?? "No Description",
              maxLines: isExpanded ? null : 2,
              overflow:
              isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}