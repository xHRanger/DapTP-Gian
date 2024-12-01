// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dap_final_gianluca/providers/provider.dart';
import 'package:dap_final_gianluca/entities/personaje.dart';
import 'package:dap_final_gianluca/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  static const String name = 'detalles';
  DetailScreen({super.key});
  TextEditingController nombreController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imagenController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {
    final List<Personaje> listaPersonajes = ref.watch(personajeProvider);
    final index = ref.watch(indexPersonajeSeleccionado);

    bool modoAgregar;
    if (index != -1) {
      nombreController.text = listaPersonajes[index].nombre;
      descController.text = listaPersonajes[index].desc;
      imagenController.text = listaPersonajes[index].imagen;
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
                  hintText: "Nombre del personaje",
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: descController,
                decoration: const InputDecoration(
                  hintText: "Descripción del personaje",
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: imagenController,
                decoration: const InputDecoration(
                  hintText: "Link a la imagen del personaje",
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (modoAgregar) {
                  ref.read(personajeProvider.notifier).subirDatos(
                        nombreController.text,
                        descController.text,
                        imagenController.text,
                      );
                } else {
                  ref.read(personajeProvider.notifier).modificarDatos(
                        listaPersonajes[index].id,
                        nombreController.text,
                        descController.text,
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
                  db.collection("Personaje").doc(listaPersonajes[index].id).delete();
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
