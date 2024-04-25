import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final String usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hola $usuario",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              ElevatedButton(
                onPressed: (){
                  context.go('/login');
                }, 
                child: const Text("Logout")
              ),
            ],
          )
        )
    );
  }
}