import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgrounColor;
  final Color fontColor;
  final Color borderColor;
  bool pressed = false;
  final VoidCallback onTap;
  NextButtonWidget({
    required this.label,
    required this.backgrounColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
    });

    NextButtonWidget.purple({required String label, required VoidCallback onTap}) 
      : this.backgrounColor =  AppColors.levelButtonFacil,
        this.fontColor = AppColors.levelButtonTextFacil,
        this.borderColor = AppColors.levelButtonBorderFacil,
        this.onTap = onTap,
        this.label = label;
    NextButtonWidget.green({required String label, required VoidCallback onTap,}) 
          : this.backgrounColor = AppColors.levelButtonMedio,
            this.fontColor = AppColors.levelButtonTextMedio,
            this.borderColor =  AppColors.levelButtonBorderMedio,
            this.onTap = onTap,
            this.label = label;

    NextButtonWidget.orange({required String label, required VoidCallback onTap}) 
          : this.backgrounColor = AppColors.levelButtonDificil,
            this.fontColor = AppColors.levelButtonTextDificil,
            this.borderColor = AppColors.levelButtonBorderDificil,
            this.onTap = onTap,
            this.label = label;

    NextButtonWidget.red({required String label, required VoidCallback onTap}) 
          : this.backgrounColor =AppColors.levelButtonPerito,
            this.fontColor =  AppColors.levelButtonTextPerito,
            this.borderColor = AppColors.levelButtonBorderPerito,
            this.onTap = onTap,
            this.label = label;



  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
          child: Container(
        decoration: BoxDecoration(
          color: backgrounColor,
          border: Border.fromBorderSide(BorderSide(
            color: borderColor)),
          
          borderRadius: BorderRadius.circular(28)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              color: fontColor, fontSize: 13),
            

            ),
        ),
        ),
    );
    
  }
}