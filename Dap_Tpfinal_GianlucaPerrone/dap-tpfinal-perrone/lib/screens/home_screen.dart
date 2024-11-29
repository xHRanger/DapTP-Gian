import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dap_final_dodino/entities/juegos.dart';
import 'package:dap_final_dodino/screens/details_screen.dart';
import 'package:dap_final_dodino/providers/provider.dart';

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
    ref.read(juegoProvider.notifier).obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    final List<Juego> listaJuego = ref.watch(juegoProvider);
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
                    subtitle: Text(listaJuego[index].tipo),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(listaJuego[index].imagen),
                    ),
                    onTap: () {
                      ref.read(indexJuegoSeleccionado.notifier).state = index;
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
              ref.read(indexJuegoSeleccionado.notifier).state = -1;
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
