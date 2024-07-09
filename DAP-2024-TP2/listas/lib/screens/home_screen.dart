// ignore_for_file: must_be_immutable
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:listas/entities/pokemon.dart';
import 'package:listas/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  HomeScreen({super.key});

  List<Pokemon> pokemones = [
    Pokemon('Pikachu', 'Pokémon de color amarillo que es un ratón', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbfzYtn-eRiOeIygbWQ6S5yecoe-TpaJGngA&s'),
    Pokemon('Charmander', 'Pokémon de color rojo que evoluciona a un dragon', 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png'),
    Pokemon('Togepi', 'Pokémon de muchos colores basado en huevo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPZR0ZB7PCULDaPus_EB7b-nQDRda3j_JcVA&s'),
    Pokemon('Charizard', 'Pokémon que es un dragon evolución de charmander', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxnHcsy6KiGjDw31evpwg1fqekzsOw9bg6LA&s'),
    Pokemon('Snorlax', 'Pokémon muy grande y dormilón', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJSo2PVnYSGU3xid9cmQGhv7IsIEWOAnPiSg&s'),
  ];
// https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png == https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbfzYtn-eRiOeIygbWQ6S5yecoe-TpaJGngA&s

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokémon'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(pokemones[index].poke),
              subtitle: Text(pokemones[index].desc),
              leading: SizedBox(width: 50, height: 50, child: Image.network(pokemones[index].imagen)),
              onTap: (){
                context.pushNamed(DetailScreen.name, extra: pokemones[index]);
              }
            ),
          );
        },
      ),
    );
  }
}
