import 'dart:convert';

import 'package:bookshelvesapp/shared/models/book_model.dart';


class ShelfModel {
  final List<BookModel> livros;

  ShelfModel({

    required this.livros,
  });

  Map<String, dynamic> toMap() {
    return {
      'livros': livros.map((x) => x.toMap()).toList(),
    };
  }

  factory ShelfModel.fromMap(Map<String, dynamic> map) {
    return ShelfModel(
      livros: List<BookModel>.from(map['livros']?.map((x) => BookModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShelfModel.fromJson(String source) => ShelfModel.fromMap(json.decode(source));
}
