import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class DatabaseService {
  final String? uid;
  
  DatabaseService({this.uid});

  final CollectionReference booksCollection = FirebaseFirestore.instance.collection("books");

  Future<void> updateUserData(String nome, String autor, int rating, String estante) async {
    return await booksCollection.doc().set({
      'nome': nome,
      'autor': autor,
      'rating': rating,
      'estante': estante,

    });
  }

  Future updateBooksUser(List<BookModel> books) async {
    var batch = _firestore.batch();
    books.forEach((book) { 
      var docRef = _firestore.collection("bookscol").doc();
      batch.set(docRef, book);

    });
    return batch.commit();
   // for (var i = 0; i < books.length; i++) {
   //   updateUserData(books[i].titulo, books[i].autor, books[i].rating, books[i].estante.toString());
   // }
  }


  Stream<QuerySnapshot> readBooks() {
    return booksCollection.snapshots();
  }

  Future<void> updateBook({
    required Estante estante,
    required String titulo,
    required String autor,
    required String rating,
    required String docId,
  }) async {
    DocumentReference documentReferencer = booksCollection.doc(uid).collection("books").doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "autor": autor,
      "estante": estante.parse,
      "nome": titulo,
      "rating": rating,
      
    };

    await documentReferencer
    .update(data)
    .whenComplete(() => print("Book item updated in the database"))
    .catchError((e) => print(e));
  }
}