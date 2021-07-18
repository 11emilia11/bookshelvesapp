import 'package:bookshelvesapp/core/app_gradients.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:bookshelvesapp/feed/widgets/score_card/score_card_widget.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final String? user;
  final int lidos;
  final int total;
  
  AppBarWidget({required this.user, required this.lidos, required this.total}) : super(
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

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                  text: "Olá, ",
                   style: AppTextStyles.title,
                   children: [
                     TextSpan(
                       text: user,
                       style: AppTextStyles.titleBold,
                     )
                   ]
                  )),

               
                
              ],
              ),
          ),
            Align(
              alignment: Alignment(0.0, 1.0),
              child: ScoreCardWidget(lidos:lidos, total: total )
              )
        ],
      )
    ),
  );
 
}