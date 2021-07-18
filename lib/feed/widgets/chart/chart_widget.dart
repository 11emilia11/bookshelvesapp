import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int total;
  final int lidos;
  const ChartWidget({required this.total, required this.lidos,Key?  key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: double.parse((lidos/total).toStringAsFixed(1)),
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),

        Center(
          child: Text(
            (lidos/total * 100).toString(),
             style: AppTextStyles.heading
             ),
        ),

      ],),
      
    );
  }
}