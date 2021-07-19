import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  
  DatabaseService({this.uid});

  // Cria um livro no firebase usando a coleção passada como parâmetro e usando o titulo como id
  Future<void> updateUserData(String nome, String autor, int rating, String estante, CollectionReference booksCollection) async {
    return await booksCollection.doc(nome).set({
      'titulo': nome,
      'autor': autor,
      'rating': rating,
      'estante': estante,

    });
  }

  // Atualiza estante do livro
  Future<void> updateBook(String col,String titulo, Estante estante) {
    return FirebaseFirestore.instance.collection(col).doc(titulo)
    .update({'estante': estante.parse})
    .then((value) => print('Livro atualizado'))
    .catchError((error) => print("Falha ao atualizar livro $error"));
  } 
}