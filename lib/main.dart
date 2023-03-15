import 'package:Sound2U/screens/login/login_prueba.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/routes.dart';
import 'styles/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Routes
  final _routes = {
    '/': (context) => const Login(),
    '/home': (context) => const MenuPage(),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.lightBlack,
    ));
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