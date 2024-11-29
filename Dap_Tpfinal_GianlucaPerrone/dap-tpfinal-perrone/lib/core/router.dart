import 'package:dap_final_dodino/screens/home_screen.dart';
import 'package:dap_final_dodino/screens/login_screen.dart';
import 'package:dap_final_dodino/screens/details_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:dap_final_dodino/screens/register_screen.dart';

final appRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: RegisterScreen.name,
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: DetailScreen.name,
    path: '/detalles',
    builder: (context, state) => DetailScreen(),
  ),
]);
