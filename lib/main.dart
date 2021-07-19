import 'package:bookshelvesapp/book/book_detail_page.dart';
import 'package:bookshelvesapp/feed/feed_page.dart';
import 'package:bookshelvesapp/home/home_page.dart';
import 'package:bookshelvesapp/recommendation/recommendation_page.dart';
import 'package:bookshelvesapp/register/register_page.dart';
import 'package:bookshelvesapp/register/widgets/register_app_bar.dart';
import 'package:flutter/material.dart';


// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if(_error) {
      return MaterialApp(
        title: "Erro",
        home: Scaffold(appBar: null, body: Center( child: Text("Erro ao inicializar o firebase :("),)),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
        title: "Carregando",
        home: Scaffold(appBar: null, body: Center( child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.purple,
        )))),
      );}
      

    return MaterialApp(
      title: "Bookshelves",
      home: HomePage()
    );
  }
}
