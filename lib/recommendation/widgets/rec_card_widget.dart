import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class RecCardWidget extends StatelessWidget {
  const RecCardWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20, right:20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Expanded(
                  flex: 1,
                  child: Icon(Icons.book, color: Color.fromRGBO(130, 87, 229, 0.695), size: 64,)
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "Recomendações", 
                          style: AppTextStyles.heading),
                        Text(
                          "Nossas recomendações para sua próxima leitura :)",
                          style: AppTextStyles.body)
                        ],
                ),
                  ),
              )
          ]),
        )),
    );
  }
}