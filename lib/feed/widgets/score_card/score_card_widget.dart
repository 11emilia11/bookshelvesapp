import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:bookshelvesapp/feed/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final int lidos;
  final int total;
  const ScoreCardWidget({ required this.lidos, required this.total,Key? key}) : super(key: key);
  
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
                  child: ChartWidget(lidos: lidos, total: total)
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
                          "Seu score de leitura", 
                          style: AppTextStyles.heading),
                        Text(
                          "Você leu ${lidos} livros até agora dos ${total} nas estantes, continue assim.",
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