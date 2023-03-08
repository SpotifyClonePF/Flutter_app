import 'package:flutter/material.dart';
import 'screens/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Routes
  final _routes = {
    '/': (context) => const LoginPage(),
    '/home': (context) => const MenuPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sound2U',
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Page404(),
        );
      },
    );
  }
}