import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookCardWidget extends StatelessWidget {


  final String title;
  final String author;
  final int rating;
  final VoidCallback onTap;

  const BookCardWidget({
     Key? key,
     required this.title,
     required this.author,
     this.rating = 0,
     required this.onTap,}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              title,
            style: AppTextStyles.heading),
            Text(
              author,
            style: AppTextStyles.author),
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