import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class DatabaseService {
  final String? uid;
  
  DatabaseService({this.uid});

  final booksRef = FirebaseFirestore.instance.collection("books1").withConverter<BookModel>(
    fromFirestore: (snapshot, _) => BookModel.fromJson(snapshot.data()!),
    toFirestore: (book, _) => book.toJson(),
    );

  final CollectionReference booksCollection = FirebaseFirestore.instance.collection("books");


  Future<void> updateUserData(String nome, String autor, int rating, String estante, CollectionReference booksCollection) async {
    return await booksCollection.doc(nome).set({
      'titulo': nome,
      'autor': autor,
      'rating': rating,
      'estante': estante,

    });
  }

  
  Stream<QuerySnapshot> readBooks() {
    return booksCollection.snapshots();
  }




  Future<void> updateBook(String col,String titulo, Estante estante) {
    return FirebaseFirestore.instance.collection(col).doc(titulo)
    .update({'estante': estante.parse})
    .then((value) => print('Livro atualizado'))
    .catchError((error) => print("Falha ao atualizar livro $error"));
  } 
}