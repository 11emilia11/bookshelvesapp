import 'package:bookshelvesapp/feed/level_button/level_button_widget.dart';
import 'package:bookshelvesapp/feed/widgets/appbar/app_bar_widget.dart';
import 'package:bookshelvesapp/feed/widgets/book_card/book_card_widget.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({ Key key }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                      BookCardWidget(),
                      BookCardWidget(),
                      BookCardWidget(),
                      BookCardWidget(),],
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
                    border: Border.all(color: Colors.purple[300], width: 2),
                  ),
                  child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: null,
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
                        onPressed: null,
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