import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dap_final_gianluca/entities/personaje.dart';

StateProvider<int> indexPersonajeSeleccionado = StateProvider((ref) => -1);

final personajeProvider = StateNotifierProvider<PersonajeNotiier, List<Personaje>>(
  (ref) => PersonajeNotiier(),
);

class PersonajeNotiier extends StateNotifier<List<Personaje>> {
  PersonajeNotiier() : super([]);

  final db = FirebaseFirestore.instance;

  Future<void> obtenerDatos() async {
    try {
      final querySnapshot = await db.collection("Personaje").get();

      final listaPersonajes = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Personaje(
          doc.id,
          data["nombre"] as String,
          data["desc"] as String,
          data["imagen"] as String,
        );
      }).toList();
      state = listaPersonajes;
    } catch (error) {
      print("Error al obtener datos: $error");
    }
  }

  Future<void> subirDatos(nombre, desc, imagen) async {
    try {
      await db
          .collection("Personaje")
          .add({"nombre": nombre, "desc": desc, "imagen": imagen});
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }

  Future<void> modificarDatos(id, nombre, desc, imagen) async {
    try {
      await db.collection("Personaje").doc(id).set(
        {"nombre": nombre, "desc": desc, "imagen": imagen},
      );
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }
}
