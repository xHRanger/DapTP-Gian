// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dap_final_dodino/providers/provider.dart';
import 'package:dap_final_dodino/entities/juegos.dart';
import 'package:dap_final_dodino/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  static const String name = 'detalles';
  DetailScreen({super.key});
  TextEditingController nombreController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController imagenController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {
    final List<Juego> listaJuego = ref.watch(juegoProvider);
    final index = ref.watch(indexJuegoSeleccionado);

    bool modoAgregar;
    if (index != -1) {
      nombreController.text = listaJuego[index].nombre;
      tipoController.text = listaJuego[index].tipo;
      imagenController.text = listaJuego[index].imagen;
      modoAgregar = false;
    } else {
      modoAgregar = true;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  hintText: "Nombre del juego",
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: tipoController,
                decoration: const InputDecoration(
                  hintText: "Tipo de juego",
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: imagenController,
                decoration: const InputDecoration(
                  hintText: "Link a la imagen del juego",
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (modoAgregar) {
                  ref.read(juegoProvider.notifier).subirDatos(
                        nombreController.text,
                        tipoController.text,
                        imagenController.text,
                      );
                } else {
                  ref.read(juegoProvider.notifier).modificarDatos(
                        listaJuego[index].id,
                        nombreController.text,
                        tipoController.text,
                        imagenController.text,
                      );
                }
                context.pushNamed(HomeScreen.name);
              },
              child: Text(
                modoAgregar ? "Agregar" : "Modificar",
              ),
            ),
            const SizedBox(height: 10),
            if (!modoAgregar)
              ElevatedButton(
                onPressed: () {
                  db.collection("Juego").doc(listaJuego[index].id).delete();
                  context.pushNamed(HomeScreen.name);
                },
                child: const Text(
                  "Eliminar",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
