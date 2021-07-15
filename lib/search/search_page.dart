
import 'package:bookshelvesapp/search/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        
        child: Row(
          children: [
            
          ],)),
      
    );
  }
}