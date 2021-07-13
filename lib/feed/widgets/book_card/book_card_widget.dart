import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookDetailPage()));
            },
            child: Column(
              children: [
                 Center(
           child: Container(
             height: 40,
             width: 40,
             child: Icon(
               Icons.book_rounded,
               color: Colors.blue[00],
               size: 32),
           ),
         ),

         SizedBox(
           height: 20,
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:[
             Text(
           "Paris é uma Festa",
            style: AppTextStyles.heading),
            Text(
           "E. Hemingway",
            style: AppTextStyles.author),
          

           ]
         ),
         
         SizedBox(
            height: 20,
          ),

              ],),
          ),
        
          
        ],
      ),
      
    );
  }
}