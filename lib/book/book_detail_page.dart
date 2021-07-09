import 'package:flutter/material.dart';

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
                decoration: BoxDecoration(color: Colors.blueGrey[300], borderRadius:  BorderRadius.circular(10.0) ),
                
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8.0),
                
                child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('The Lord of the Flies', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25, color: Colors.white), ),
                      Text('William Golding', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20, color: Colors.white), ),
                      Icon(Icons.book_rounded, size: 128,
                       color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Icon(Icons.star, color: Colors.yellow,),
                          Text('3', style: TextStyle(fontWeight: FontWeight.w400))

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                     color:Colors.blueGrey[300] ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16)),
                        onPressed: () {},
                        child: const Text('Voltar', style: TextStyle(color: Colors.white)),),
                    ),
                    
                    Container(
                     margin: EdgeInsets.all(8),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                     border: Border.all(width: 1, color: Colors.blueGrey[300]),
                     color:Colors.white),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16)),
                        onPressed: () {},
                        child: const Text('Buscar Livros', style: TextStyle(color: Colors.blueGrey)),),
                    ),
                    
                  ],
                ),
              )],
              ),
            
            )
          );

        
  }
}