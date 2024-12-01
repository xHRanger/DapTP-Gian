import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dap_final_gianluca/entities/personaje.dart';
import 'package:dap_final_gianluca/screens/details_screen.dart';
import 'package:dap_final_gianluca/providers/provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(personajeProvider.notifier).obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    final List<Personaje> listaJuego = ref.watch(personajeProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaJuego.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(listaJuego[index].nombre),
                    subtitle: Text(listaJuego[index].desc),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(listaJuego[index].imagen),
                    ),
                    onTap: () {
                      ref.read(indexPersonajeSeleccionado.notifier).state = index;
                      context.pushNamed(DetailScreen.name);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(indexPersonajeSeleccionado.notifier).state = -1;
              context.pushNamed(DetailScreen.name);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
