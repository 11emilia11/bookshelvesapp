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
              )
          ],
        ),
      )
      
    );
  }
}