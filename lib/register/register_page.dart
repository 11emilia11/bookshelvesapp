import 'package:bookshelvesapp/register/widgets/register_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterAppBar(),

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
                        onPressed: null,
                        child: const Text('Voltar' , style: TextStyle(color: Colors.grey)),
                               
                      ),
                      
                    )),
               Container(
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
                        onPressed: null,
                        child: const Text('Login', style: TextStyle(color: Colors.white)),
                               
                      ),
                      
                    )),
                
              

            ],
          ), // buttons 
        ]
      ),

      ),
      
      
    );
  }
}