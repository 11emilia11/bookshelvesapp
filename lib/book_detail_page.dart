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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('The Lord of the Flies'),
                  Text('William Golding'),
                  Icon(Icons.book_rounded),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text('3')

                  ],)],
              ),
              Row(
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

                ],

              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {},
                    child: const Text('Voltar'),),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {},
                    child: const Text('Buscar Livros'),),
                  
                ],
              )


            ],
            )),

        
      
    );
  }
}