import 'package:bookshelvesapp/services/auth.dart';
import 'package:bookshelvesapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/feed/feed_controller.dart';
import 'package:bookshelvesapp/feed/widgets/appbar/app_bar_widget.dart';
import 'package:bookshelvesapp/feed/widgets/book_card/book_card_widget.dart';
import 'package:bookshelvesapp/feed/widgets/level_button/level_button_widget.dart';
import 'package:bookshelvesapp/home/home_page.dart';
import 'package:bookshelvesapp/recommendation/recommendation_page.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:bookshelvesapp/shared/widgets/next_button_widget.dart';

class FeedPage extends StatefulWidget {
  final String nome;
  

  FeedPage({
    required this.nome,
    Key? key,
  }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Estante filter = Estante.salvo;
   final List<BookModel> books = [
      BookModel(autor: "George Orwell", titulo: "1984", rating: 0, estante: Estante.salvo),
      BookModel(autor: "William Golding", titulo: "O senhor das moscas", rating: 0, estante: Estante.salvo),
      BookModel(autor: "Haruki Murakami", titulo: "Kafka à beira mar", rating: 0, estante: Estante.salvo),
      BookModel(autor: "John Fowles", titulo: "O colecionador", rating: 0, estante: Estante.salvo),
      BookModel(autor: "Milan Kundera", titulo: "Identidade", rating: 0, estante: Estante.salvo),
      BookModel(autor: "Min Jin Lee", titulo: "Pachinko", rating: 0, estante: Estante.salvo),
  ];

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("books5").snapshots();

  @override
  Widget build(BuildContext context) {
  
    return  StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar:  AppBarWidget( user: widget.nome, lidos: 3, total: 6),
          // books.where((element) => element.estante == Estante.lido).length, 
          // total : books.length),
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

                 NextButtonWidget.orange(
                  label: "Salvos",
                  onTap: () {
                    setState(() {
                      filter = Estante.salvo;
                    });
                  },
                ),

                NextButtonWidget.purple(
                  label: "Lido",
                  onTap: () {
                    setState(() {
                      filter = Estante.lido;
                    });
                  },
                  
                ),

                NextButtonWidget.green(
                  label: "Lendo",
                  onTap: () {
                    setState(() {
                      filter = Estante.lendo;
                    });

                  },
                ),

               
                NextButtonWidget.red(
                  label: "Suspenso",
                  onTap: () {
                    setState(() {
                      filter = Estante.suspenso;
                    });
                    
                  },
                ),
              ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 //childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    BookModel livro =  BookModel(autor: snapshot.data!.docs[index]['autor'], titulo: snapshot.data!.docs[index]['titulo'],
                    estante: snapshot.data!.docs[index]['estante'].toString().parse, rating: snapshot.data!.docs[index]['rating']);
                    //if (livro != null) { livro = BookModel(autor: livro.autor, titulo: livro.titulo, rating: livro.rating, estante: livro.estante);}
                    return  BookCardWidget(book:livro, onTap: () {
                            
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => BookDetailPage(book:livro!, nome:this.widget.nome, uid: "books5")));
                                
                    }); 
                      

                  }, itemCount: snapshot.data!.docs.length,
                )

                /*
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    crossAxisCount: 2,
                    children: [
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                        BookModel livro = BookModel.fromJson(data);
                          return 
                            if (books[i].estante == filter)
                            BookCardWidget(book: livro, onTap: () {
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => BookDetailPage(book:livro, nome:this.widget.nome)));
                                
                                }
                              );
                      })
                      
                      ],
                  ), */
              ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                 
                },

                child: Container(
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
                              MaterialPageRoute(builder: (context) => RecommendationPage(books: books, nome: this.widget.nome,)),
                            );
                          
                        },
                        child: const Text('Recomendações' , style: TextStyle(color: Colors.black87)),
                                
                      ),
                   )),
              ),

               GestureDetector(
                  onTap: ()  {
                    
                  },
                  child: Container(
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
                          onPressed: () async {
                           await FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()));

                          },
                          child: const Text('Sair', style: TextStyle(color: Colors.white)),
                                  
                        ),
                        
                      )),
               ),
                
            ],
          ), // buttons 
          ],
        ),
      )
        
        /*
        ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return new ListTile(
              title: new Text(data['titulo']),
              subtitle: new Text(data['autor']),
            );
          }).toList(),
        )*/
        
        );
      },
    );
  }

/*


Scaffold(
      appBar: AppBarWidget( user: widget.nome, lidos: books.where((element) => element.estante == Estante.lido).length, total : books.length),
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

                 NextButtonWidget.orange(
                  label: "Salvos",
                  onTap: () {
                    setState(() {
                      filter = Estante.salvo;
                    });
                  },
                ),

                NextButtonWidget.purple(
                  label: "Lido",
                  onTap: () {
                    setState(() {
                      filter = Estante.lido;
                    });
                  },
                  
                ),

                NextButtonWidget.green(
                  label: "Lendo",
                  onTap: () {
                    setState(() {
                      filter = Estante.lendo;
                    });

                  },
                ),

               
                NextButtonWidget.red(
                  label: "Suspenso",
                  onTap: () {
                    setState(() {
                      filter = Estante.suspenso;
                    });
                    
                  },
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
                        if (books[i].estante == filter)
                          BookCardWidget(book: books[i], onTap: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BookDetailPage(book:books[i], nome:this.widget.nome)));
                            
                          })
                      ],
                  ),
              ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              
              GestureDetector(
                onTap: () {
                 
                },

                child: Container(
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
                              MaterialPageRoute(builder: (context) => RecommendationPage(books: books, nome: this.widget.nome,)),
                            );
                          
                        },
                        child: const Text('Recomendações' , style: TextStyle(color: Colors.black87)),
                                
                      ),
                   )),
              ),

               GestureDetector(
                  onTap: ()  {
                    
                  },
                  child: Container(
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
                          onPressed: () async {
                           await FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()));

                          },
                          child: const Text('Sair', style: TextStyle(color: Colors.white)),
                                  
                        ),
                        
                      )),
               ),
                
            ],
          ), // buttons 
          ],
        ),
      )
      
    );
*/}