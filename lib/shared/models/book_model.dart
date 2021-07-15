import 'dart:convert';

import 'package:flutter/material.dart';

enum Estante{ lido, lendo, salvo, suspenso, vazio }

extension EstanteStringExt on String {
  Estante get parse => {
      "lido": Estante.lido,
      "lendo": Estante.lendo,
      "salvo": Estante.salvo,
      "suspenso": Estante.suspenso,
      "vazio": Estante.vazio }[this]!;
}

extension EstanteExt on Estante {
  String get parse => {
      Estante.lido : "lido",
      Estante.lendo : "lendo",
      Estante.salvo: "salvo",
      Estante.suspenso: "suspenso",
      Estante.vazio: "vazio",
      }[this]!;
}

class BookModel {
  final String titulo;
  final String autor;
  final Estante estante;

  BookModel({
    required this.titulo,
    required this.autor,
    required this.estante,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'autor': autor,
      'estante': estante.parse,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      titulo: map['titulo'],
      autor: map['autor'],
      estante: map['estante'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source));
}
