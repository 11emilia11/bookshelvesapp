import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

class AuthService {
  // create user obj based on firebase user

  final FirebaseAuth _auth = FirebaseAuth.instance;


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

  // register with email and password

  // sign out

}
