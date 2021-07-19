import 'package:bookshelvesapp/feed/feed_page.dart';
import 'package:bookshelvesapp/home/home_page.dart';
import 'package:bookshelvesapp/register/widgets/register_app_bar.dart';
import 'package:bookshelvesapp/services/auth.dart';
import 'package:bookshelvesapp/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String name = ' ';
  String email = ' ';
  String password = ' ';
  String error = ' ';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('Digite seu nome'),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Digite seu nome' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
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
                validator: (val) => val!.length < 6 ? 'A senha precisa ter 6 dígitos ao menos' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },),
                SizedBox(height: 20.0),
                Text(error, style: TextStyle(color: Colors.red),),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                    
                    }
                    
                  ,
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
                        'Voltar',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ), 
                      ),
                      
                    )),
              ),

            GestureDetector(
                onTap: () async {
                  int i = 0;
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            i += 1;
                            setState(() {
                              error = 'Forneça um e-mail válido';
                            });
                          } else if (i == 0) {
                            setState(() {
                              error = '';
                            });
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FeedPage(nome: email,)));

                          }
                }},
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
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ), 
                    ),
                    
                  )),),


            ],))));

  }
}

    /*
      body: Padding(
        padding:const EdgeInsets.all(8.0),
        child: ListView(
        children: <Widget> [
        
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: TextField(
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                    
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      
                    )
                  ),
              ),
                SizedBox(
                height: 24,
              ),
                 Container(
                padding: EdgeInsets.all(8),
                child: TextField(
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    )
                  ),
              ),
                SizedBox(
                height: 24,
              ),
                 Container(
                padding: EdgeInsets.all(8),
                child: TextField(
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    )
                  ),
              ),
             
            ],
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              GestureDetector(
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()));
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
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            
                          },
                          child: const Text('Voltar' , style: TextStyle(color: Colors.grey)),
                                 
                        ),
                        
                      )),
              ),
               GestureDetector(
                 onTap: () {

                   
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
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FeedPage())
                            );
                          },
                          child: const Text('Login', style: TextStyle(color: Colors.white)),
                                
                        ),
                        
                      )),
               ),
                
              

            ],
          ), // buttons 
        ]
      ),

      ),
      
      
    );
  }
  */
