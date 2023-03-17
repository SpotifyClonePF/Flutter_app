import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      minimumSize: Size(650, 650),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
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
    '/login': (context) => const Login(),
    '/signup': (context) => const SignUp(),
    '/home': (context) => const MenuPage(),
    '/welcome': (context) => WelcomePage(),
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.lightBlack,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sound2U',
      initialRoute: isMobile ? '/welcome' : '/login',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Page404(),
        );
      },
    );
  }
}