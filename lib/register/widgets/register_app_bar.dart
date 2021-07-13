import 'package:bookshelvesapp/core/app_gradients.dart';
import 'package:bookshelvesapp/register/widgets/register_card_widget.dart';
import 'package:flutter/cupertino.dart';

class RegisterAppBar extends PreferredSize {
  RegisterAppBar() : super(
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
              child: RegisterCardWidget()
              )
        ],
      )
    ),
  );
  
}