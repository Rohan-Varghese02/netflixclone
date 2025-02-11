import 'package:flutter/material.dart';
import 'package:netflix/screens/download/download_page.dart';
import 'package:netflix/screens/search/search_page.dart';

Widget downloadButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DownloadPage()),
        );
      },
      child: const Icon(Icons.download, color: Colors.white, size: 30),
    ),
  );
}

Widget screenShareButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: GestureDetector(
      onTap: () {
      },
      child: Icon(Icons.screen_share, color: Colors.white, size: 30),
    ),
  );
}

Widget searchButton(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SearchPage())),
      child: Icon(Icons.search, color: Colors.white, size: 30)),
  );
}
