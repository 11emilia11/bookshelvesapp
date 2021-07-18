
import 'package:bookshelvesapp/feed/feed_page.dart';
import 'package:bookshelvesapp/home/widgets/home_app_bar.dart';
import 'package:bookshelvesapp/register/register_page.dart';
import 'package:bookshelvesapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String error = ' ';
  String email = ' ';
  String password = ' ';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),

        body: 
        
        Padding(
            //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  
                  SizedBox(height: 20.0),
                  Text('Digite seu e-mail'),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Digite seu e-mail' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text('Digite sua senha'),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val!.isEmpty ? 'Digite sua senha' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },),
                    SizedBox(height: 20.0),
                    Text(error, style: TextStyle(color: Colors.red),),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () async {
                        int i = 0;
                        if(_formKey.currentState!.validate()){
                          dynamic result = await _auth.signInwithEmailandPassword(email, password);
                          if (result == null) {
                            i += 1;
                            setState(() {
                              error = 'E-mail ou senha incorretos';
                            });
                          } else if (i == 0) {
                            setState(() {
                              error = '';
                            });
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FeedPage(nome: email,)));

                          }

                          /*
                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                            
                              setState(() => error = 'Nenhum usuário com esse e-mail :/');
                              
                              i += 1;
                            } else if (e.code == 'wrong-password') {
                              
                              setState(() => error = 'Senha incorreta :/');

                              i += 1;
                              
                            }
                          }
                          if (i == 0) {
                             
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeedPage(nome: email,)));

                          }
                          */

                         

                        }
                       
                      },
                      child: Container(
                      height: 50.0,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color:  Color(0xFF04D361),
                      ),
                      child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ), 
                          ),
                          
                        )),
                  ),

                GestureDetector(
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Color(0xFF04D361), width: 2),
                      
                    ),
                    child: Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ), 
                        ),
                        
                      )),),
                  
                     // 
                

                ],)
    
                /*
 GestureDetector(
                    onTap: () async {
                      print('TAPPED');
                     
                      

                    },
                    child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Color(0xFF04D361), width: 2),
                      
                    ),
                    child: Center(
                        child: Text(
                          'Login sem cadastro',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ), 
                        ),
                        
                      )),),
                     
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                   // controller: nameController,
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
                SizedBox(
                height: 24,
              ),
                
                Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Color(0xFF04D361), width: 2),
                  ),
                  child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: const Text('Cadastro' , style: TextStyle(color: Colors.grey)),
                               
                      ),
                      
                    )),*/
              
            ),
            ),
            
      
    );
 
  }
}