import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login/Loginnn.dart';
import 'screens/login/login_prueba.dart';
import 'screens/routes.dart';
import 'styles/colors.dart';
import 'package:window_manager/window_manager.dart';

void main() async {

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      center: false,
      backgroundColor: Colors.transparent,
      minimumSize: Size(500, 500),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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