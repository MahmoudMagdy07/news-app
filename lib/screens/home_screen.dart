import 'package:flutter/material.dart';
import 'package:news_app/widgets/artical_item.dart';
import 'package:news_app/widgets/artical_listview.dart';
import 'package:news_app/widgets/catogery_listview.dart';
import 'package:news_app/widgets/news_catogery_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30,))
        ],
        backgroundColor: Colors.blueGrey,
        title: Text("News App", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10,)),
          SliverToBoxAdapter(child: CatogeryListview()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Genral News", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ),
          ArticleListview(),        ],
      ),
    );
  }
}