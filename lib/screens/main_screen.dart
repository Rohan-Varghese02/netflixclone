import 'package:flutter/material.dart';
import 'package:netflix/screens/home/home_page.dart';
import 'package:netflix/screens/mynetflix/mynetflix.dart';
import 'package:netflix/screens/news_and_hot/news_hot_page.dart';
import 'package:netflix/widgets/bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  final pages =[
    HomePage(),
    NewsHotPage(),
    Mynetflix(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int value,_){
        return pages[value];
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}