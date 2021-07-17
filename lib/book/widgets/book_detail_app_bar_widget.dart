import 'package:bookshelvesapp/core/app_gradients.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class BookDetailAppBarWidget extends PreferredSize {
  final String user;
  
  BookDetailAppBarWidget({required this.user}) : super(
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
            
        ],
      )
    ),
  );
 

}