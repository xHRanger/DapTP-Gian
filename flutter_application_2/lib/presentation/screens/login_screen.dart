import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();
String user = "Gian";
String pass = "Contraseña";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Logueo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  icon: Icon(Icons.key)
                  ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if(userController.text == user && passController.text == pass){
                    context.go('/home/${userController.text}');
                  }
                  else if(userController.text == '' && passController.text == ''){
                    print('Usuario y Contraseña Vacios');
                  }
                  else if(userController.text == ''){
                    print('Usuario Vacio');
                  }
                  else if(passController.text == ''){
                    print('Contraseña Vacia');
                  }
                  else if(userController.text != user){
                    print('Usuario o Contraseña incorrecto');
                  }
                  else if(passController.text != pass){
                    print('Usuario o Contraseña incorrecto');
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
    );
  }
}