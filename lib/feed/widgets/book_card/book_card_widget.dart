import 'package:flutter/material.dart';

import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';

class BookCardWidget extends StatelessWidget {

  final BookModel book;
  //final String title;
  //final String author;
  //final int rating;
  final VoidCallback onTap;

  const BookCardWidget({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
             height: 40,
             width: 40,
             child: Icon(Icons.book_rounded,color: Colors.blue[300],size: 32),
           ),

          SizedBox(
           height: 20,
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:[
             Text(
              book.titulo,
              style: TextStyle(fontSize:16,fontWeight: FontWeight.bold, )),
            Text(
              book.autor,
              style: TextStyle(fontSize:13,fontWeight: FontWeight.w400, )),
           ]
         ),
         
         SizedBox(
            height: 20,
          ),

          
         ]),
      )
    );
   
  }
}
