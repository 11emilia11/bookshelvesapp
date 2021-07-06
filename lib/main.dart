import 'package:bookshelvesapp/book_detail_page.dart';
import 'package:bookshelvesapp/home_page.dart';
import 'package:bookshelvesapp/register_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bookshelves", 
      home: BookDetailPage(
  
        ),
      );
     
  } 
}
