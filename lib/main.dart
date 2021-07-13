import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/feed/feed_page.dart';
import 'package:bookshelvesapp/home/home_page.dart';
import 'package:bookshelvesapp/recommendation/recommendation_page.dart';
import 'package:bookshelvesapp/register/register_page.dart';
import 'package:bookshelvesapp/register/widgets/register_app_bar.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bookshelves", 
      home: FeedPage(
  
        ),
      );
     
  } 
}
