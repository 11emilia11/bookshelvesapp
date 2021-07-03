import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.book_rounded, color: Colors.purple),
              Text('Bookshelves', style: TextStyle(),),
              

            ]
          ),
           // appbar
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
          ), // form 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {},
                child: const Text('Voltar'),),

              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {},
                child: const Text('Entrar'),),
              

            ],
          ), // buttons 
        ]
      ),

      ),
      
      
    );
  }
}