import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/feed/feed_controller.dart';
import 'package:bookshelvesapp/feed/widgets/level_button/level_button_widget.dart';
import 'package:bookshelvesapp/feed/widgets/appbar/app_bar_widget.dart';
import 'package:bookshelvesapp/feed/widgets/book_card/book_card_widget.dart';
import 'package:bookshelvesapp/home/home_page.dart';
import 'package:bookshelvesapp/recommendation/recommendation_page.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:bookshelvesapp/shared/widgets/next_button_widget.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({ Key? key }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<BookModel> books = [
     BookModel(autor: "George Orwell", titulo: "1984", rating: 0, estante: Estante.lido),
     BookModel(autor: "William Golding", titulo: "O senhor das moscas", rating: 0, estante: Estante.lido),
     BookModel(autor: "Haruki Murakami", titulo: "Kafka à beira mar", rating: 0, estante: Estante.lido),
     BookModel(autor: "John Fowles", titulo: "O colecionador", rating: 0, estante: Estante.lido),
     BookModel(autor: "Milan Kundera", titulo: "Identidade", rating: 0, estante: Estante.lido),
     BookModel(autor: "Min Jin Lee", titulo: "Pachinko", rating: 0, estante: Estante.lido),
     ];
  final UserModel user = UserModel(uid: "Emilia", email:"email@example.com", password: "123");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget( user: user,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                height: 24,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: "Lido",
                ),

                LevelButtonWidget(
                  label: "Lendo",
                ),

                LevelButtonWidget(
                  label: "Salvos",
                ),

                LevelButtonWidget(
                  label: "Suspenso",
                ),
              ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    crossAxisCount: 2,
                    children: [
                   
                      for (var i = 0; i < books.length; i++) 
                        if (books[i].estante == Estante.lido)
                          BookCardWidget(book: books[i], onTap: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BookDetailPage(book:books[i])));
                            
                          })
                      ],
                  ),
              ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              
              Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecommendationPage(books: books)),
                          );
                        },
                        child: const Text('Recomendações' , style: TextStyle(color: Colors.black87)),
                               
                      ),
                      
                    )),
               Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),

                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color:  Color(0xFFCC3750),
                  ),
                  child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: const Text('Sair', style: TextStyle(color: Colors.white)),
                               
                      ),
                      
                    )),
                
            ],
          ), // buttons 
          ],
        ),
      )
      
    );
  }
}