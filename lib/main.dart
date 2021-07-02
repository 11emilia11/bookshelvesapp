import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
 
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
       /*   title: Text('Bookshelves'), */
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Bookshelves',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.book_rounded,
                      color: Colors.purple[300],
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite seu e-mail',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite sua senha',
                    ),
                  ),
                ),
                

                
                Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),

                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.purple[300],
                  ),
                  child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle( 
                        color: Colors.white),
                      ),
                      
                    )),
                Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.purple[300], width: 3),
                  ),
                  child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle( 
                        color: Colors.grey[800]),
                      ),
                      
                    )),
              ],
            )));
  }
}