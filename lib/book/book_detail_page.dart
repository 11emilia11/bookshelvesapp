import 'package:flutter/material.dart';
import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';

class BookDetailPage extends StatefulWidget {
  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: AppColors.border)),color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)
                  ),
                
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8.0),
                
                child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('The Lord of the Flies', style: AppTextStyles.heading ),
                      Text('William Golding', style: AppTextStyles.heading15 ),
                      Icon(Icons.book_rounded, size: 128,
                       color: AppColors.lightGrey),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Icon(Icons.star, color: Colors.yellow,),
                          Text('3', style: AppTextStyles.body)

                      ],)],
                  ),),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.bookmark_border),
                        Text('Salvar')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.bookmark_border),
                        Text('Lido')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.bookmark_border),
                        Text('Lendo')
                      ],
                    ), 
                    ],),
              ),

              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: const EdgeInsets.only(left: 128, right: 128, top: 4, bottom: 4),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                      
                     color: AppColors.darkGreen ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16)),
                        onPressed: () {},
                        child: const Text('Voltar', style: TextStyle(color: Colors.white)),),
                    ),
                    
                    Container(
                     margin: EdgeInsets.all(8),
                     padding: const EdgeInsets.only(left: 128, right: 128, top: 4, bottom: 4),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                     border: Border.all(width: 1, color:  Color(0xFFE1E1E6)),
                     color:Colors.white),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16)),
                        onPressed: () {},
                        child: const Text('Buscar', style: TextStyle(color:  Color(0xFFA6A1B2))),),
                    ),
                    
                  ],
                ),
              )],
              ),
            
            )
          );

        
  }
}