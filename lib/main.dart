import 'package:donut_app_2b_rodriguez/Pages/home_page.dart';
import 'package:donut_app_2b_rodriguez/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtener instancia de SharedPreferences para verificar el token
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('jwt'); // Cambia 'jwt' si usas otro nombre

  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donut App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomePage() : const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
