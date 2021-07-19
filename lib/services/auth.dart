import 'package:bookshelvesapp/services/database.dart';
import 'package:bookshelvesapp/shared/models/book_model.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

class AuthService {
  // create user obj based on firebase user

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  final List<BookModel> books = [
      BookModel(autor: "George Orwell", titulo: "1984", rating: 0, estante: Estante.salvo),
      BookModel(autor: "William Golding", titulo: "O senhor das moscas", rating: 0, estante: Estante.salvo),
      BookModel(autor: "Haruki Murakami", titulo: "Kafka à beira mar", rating: 0, estante: Estante.salvo),
      BookModel(autor: "John Fowles", titulo: "O colecionador", rating: 0, estante: Estante.salvo),
      BookModel(autor: "Milan Kundera", titulo: "Identidade", rating: 0, estante: Estante.salvo),
      BookModel(autor: "Min Jin Lee", titulo: "Pachinko", rating: 0, estante: Estante.salvo),
  ];


  UserModel? _userFromFireBase(User user) { 
    //UserModel user = UserModel(uid: uid, email: email, password: password);
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // sign in anon
  Future signInwithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;

    }
  }

  // sign in with emaik and password


  Future registerWithEmailAndPassword (String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // criar um novo documento com os livros para o usuário
      // fazer o for aq chamando esse negocio de baixo
      
      await DatabaseService(uid: user!.uid).updateUserData("A morte feliz", "Milan Kundera", 4, "salvo");
      await DatabaseService(uid: user.uid).updateUserData("Pachinko", "Min Jin Lee", 4, "salvo");
      await DatabaseService(uid: user.uid).updateUserData("A náusea", "Jean Paul Sartre", 4, "salvo");
      await DatabaseService(uid: user.uid).updateUserData("A utopia", "Thomas More", 4, "salvo");
      await DatabaseService(uid: user.uid).updateUserData("O Banquete", "Platão", 4, "salvo");
      await DatabaseService(uid: user.uid).updateUserData("A metamorfose", "Franz Kafka", 4, "salvo");
      await DatabaseService(uid: user.uid).updateUserData("O mito de Sisifo", "Albert Camus", 4, "salvo");
  
      //await DatabaseService(uid: user!.uid).updateBooksUser(books);
      return _userFromFireBase(user);

    } catch (error) {
      print(error.toString());
      return null;

    }
  }
  // register with email and password

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();

    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}
