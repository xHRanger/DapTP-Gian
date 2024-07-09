// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const String name = 'detalles';
  dynamic poke;
  DetailScreen({super.key, this.poke = 0});
  
  @override
  Widget build(BuildContext context) {
    var x = poke.poke;
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 500, height: 500, child: Image.network(poke.imagen)),
          Text(
            "El pokemon es: $x",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            poke.desc,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}