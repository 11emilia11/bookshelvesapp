import 'package:bookshelvesapp/core/app_colors.dart';
import 'package:bookshelvesapp/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatefulWidget {

  final String label;
   LevelButtonWidget({
    Key?  key,
      required this.label,
    }) : assert(["Lido", "Lendo", "Salvos", "Suspenso"].contains(label)),super(key: key);

  @override
  _LevelButtonWidgetState createState() => _LevelButtonWidgetState();
}

class _LevelButtonWidgetState extends State<LevelButtonWidget> {
  final config = {
    "Lido": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },

    "Lendo": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },

    "Salvos": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },

    "Suspenso": {
      "color": AppColors.levelButtonPerito,
     "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },

  };

  Color get color => config[widget.label]!['color']!;

  Color get borderColor => config[widget.label]!['borderColor']!;

  Color get fontColor => config[widget.label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
          child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.fromBorderSide(BorderSide(
            color: borderColor)),
          
          borderRadius: BorderRadius.circular(28)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          child: Text(
            widget.label,
            style: GoogleFonts.notoSans(
              color: fontColor, fontSize: 13),
            

            ),
        ),
        ),
    );
  }
}