import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dap_final_dodino/entities/juegos.dart';

StateProvider<int> indexJuegoSeleccionado = StateProvider((ref) => -1);

final juegoProvider = StateNotifierProvider<JuegoNotiier, List<Juego>>(
  (ref) => JuegoNotiier(),
);

class JuegoNotiier extends StateNotifier<List<Juego>> {
  JuegoNotiier() : super([]);

  final db = FirebaseFirestore.instance;

  Future<void> obtenerDatos() async {
    try {
      final querySnapshot = await db.collection("Juego").get();

      final listaJuegos = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Juego(
          doc.id,
          data["nombre"] as String,
          data["tipo"] as String,
          data["imagen"] as String,
        );
      }).toList();
      state = listaJuegos;
    } catch (error) {
      print("Error al obtener datos: $error");
    }
  }

  Future<void> subirDatos(nombre, tipo, imagen) async {
    try {
      await db
          .collection("Juego")
          .add({"nombre": nombre, "tipo": tipo, "imagen": imagen});
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }

  Future<void> modificarDatos(id, nombre, tipo, imagen) async {
    try {
      await db.collection("Juego").doc(id).set(
        {"nombre": nombre, "tipo": tipo, "imagen": imagen},
      );
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }
}
