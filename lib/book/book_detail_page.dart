import 'package:bookshelvesapp/feed/feed_page.dart';
import 'package:bookshelvesapp/feed/widgets/appbar/app_bar_widget.dart';
import 'package:bookshelvesapp/search/search_page.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';

class BookDetailPage extends StatelessWidget {
  final UserModel user = UserModel(name: "Emilia", email: "example@gmail.com", password: "123456");
  final BookModel book;

  BookDetailPage({Key? key,required this.book }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(user: user),
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
                      Text(book.titulo, style: TextStyle(fontSize:24,fontWeight: FontWeight.bold, ) ),
                      Text(book.autor, style: TextStyle(fontSize:16,fontWeight: FontWeight.w300, )),
                      Icon(Icons.book_rounded, size: 128,
                       color: Colors.blue[300]),
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
                        Icon(Icons.bookmark_border, color: Color(0xFF57B6E5)),
                        Text('Salvar',style: TextStyle(color: AppColors.black),)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.bookmark_border,  color: Colors.greenAccent[400]),
                        Text('Lido', style: TextStyle(color: AppColors.black),)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.bookmark_border, color:Color.fromRGBO(130, 87, 229, 0.695)),
                        Text('Lendo',style: TextStyle(color: AppColors.black),)
                      ],
                    ), 
                    ],),
              ),
              SizedBox(
                height: 64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    //padding: const EdgeInsets.only(left: 128, right: 128, top: 4, bottom: 4),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                    
                   color: AppColors.darkGreen ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FeedPage()));
                      },
                      child: const Text('Voltar', style: TextStyle(color: Colors.white)),),
                  ),
                  
                  Container(
                   margin: EdgeInsets.all(8),
                   //padding: const EdgeInsets.only(left: 128, right: 128, top: 4, bottom: 4),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                   border: Border.all(width: 1, color:  Color(0xFFE1E1E6)),
                   color:Colors.white),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()));
                      },
                      child: const Text('Buscar', style: TextStyle(color:  Color(0xFFA6A1B2))),),
                  ),
                  
                ],
              )],
              ),
            
            )
          );
    
  }
  
}
