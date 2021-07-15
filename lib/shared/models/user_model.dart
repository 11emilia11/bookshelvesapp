import 'dart:convert';

import 'package:bookshelvesapp/shared/models/book_model.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  final List<BookModel> books;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.books});

    
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'books': books.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      books: List<BookModel>.from(map['books']?.map((x) => BookModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
