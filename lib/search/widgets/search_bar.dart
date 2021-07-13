import 'package:bookshelvesapp/core/app_gradients.dart';
import 'package:bookshelvesapp/search/widgets/search_card_widget.dart';
import 'package:flutter/cupertino.dart';

class SearchBar extends PreferredSize {
   SearchBar() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
           padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(gradient: AppGradients.linear),

          ),
            Align(
              alignment: Alignment(0.0, 1.0),
              child: SearchCardWidget()
              )
        ],
      )
    ),
  );
}