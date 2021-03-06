
import 'package:flutter/material.dart';

enum Estante{ lido, lendo, salvo, suspenso, padrao }

extension EstanteStringExt on String {
  Estante get parse => {
      "lido": Estante.lido,
      "lendo": Estante.lendo,
      "salvo": Estante.salvo,
      "suspenso": Estante.suspenso,
      "padrao": Estante.padrao }[this]!;
}

extension EstanteExt on Estante {
  String get parse => {
      Estante.lido : "lido",
      Estante.lendo : "lendo",
      Estante.salvo: "salvo",
      Estante.suspenso: "suspenso",
      Estante.padrao: "padrao",
      }[this]!;
}

class BookModel {
  final String titulo;
  final String autor;
  final int rating;
  Estante estante;


  BookModel({
    required this.titulo,
    required this.autor,
    this.rating = 0,
    this.estante = Estante.padrao,

  });
  
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'autor': autor,
      'rating': rating,
      'estante': estante.parse,
    };
  }

  BookModel.fromJson(Map<String, Object?> json) 
    : this(
      titulo: json['titulo']! as String,
      autor: json['autor']! as String,
      rating: json['rating']! as int,
      estante: json['estante'].toString().parse,
  );

  Map<String, Object?> toJson() {
    return {
      'titulo': titulo,
      'autor': autor,
      'rating': rating,
      'estante': estante.parse,
    };
  }
  

  //String toJson() => json.encode(toMap());

  //factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source));
}
