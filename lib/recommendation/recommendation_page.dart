import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/feed/feed_page.dart';
import 'package:bookshelvesapp/feed/widgets/book_card/book_card_widget.dart';
import 'package:bookshelvesapp/recommendation/widgets/rec_app_bar.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {

  final List<BookModel> books;
  RecommendationPage({ Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: RecAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                height: 8,
              ),
 
              Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    crossAxisCount: 2,
                    children: [
                      for (var i = 0; i < books.length; i++) 
                        BookCardWidget(book: books[i], onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BookDetailPage(book:books[i])));
                        })],
                  ),
              ),
              
                
              Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Color(0xFF04D361), width: 2),
                  ),
                  child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeedPage()));
                        },
                        child: const Text('Voltar' , style: TextStyle(color: Colors.grey)),
                               
                      ),
                      
                    )),
               
                      
                  
                
              

      
          ],
        ),
      )
      
      
    );
  }

  
}
