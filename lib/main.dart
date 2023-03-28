import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'package:firedart/firedart.dart';
import 'screens/routes.dart';
import 'styles/colors.dart';
import 'package:window_manager/window_manager.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:Sound2U/bean/User.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:Sound2U/services/firebase_service.dart';
import 'package:Sound2U/services/firebase_services_windows.dart';

const apiKey = 'AIzaSyCSCECr3eK6uh0B7hhpTt9smAu22oRgGG4';
const projectId = 'dyzr-541db';
bool recordUser = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      center: false,
      backgroundColor: material.Colors.transparent,
      minimumSize: Size(815, 650),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
  } else {
    if (Platform.isWindows) {
      Firestore.initialize(projectId);
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await requestPermission();
      await FlutterDownloader.initialize();
    }
  }
  recordUser = await save();
  runApp(const material.MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

Future<bool> save() async {
  final storage = FileStorage();
  final loadedUser = await storage.loadUser();
  if (loadedUser != null) {
    if (Platform.isWindows) {
      if (await getPeopleWindows(loadedUser.username, loadedUser.password)) {
        return true;
      }
    } else {
      if (await getPeople(loadedUser.username, loadedUser.password)) {
        return true;
      }
    }
  }
  return false;
}

Future<void> requestPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Routes
  final _routes = {
    '/': (context) => const WelcomePage(),
    '/login': (context) => const Login(),
    '/signup': (context) => const SignUp(),
    '/home': (context) => const MenuPage(),
    '/home_desk': (context) => const HomeDesktopPage(),
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.lightBlack,
    ));
    if (recordUser) {
      return material.MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sound2U',
        initialRoute: isMobile ? '/home' : '/home_desk',
        routes: _routes,
        onGenerateRoute: (settings) {
          return material.MaterialPageRoute(
            builder: (context) => const Page404(),
          );
        },
      );
    } else {
      return material.MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sound2U',
        initialRoute: isMobile ? '/' : '/login',
        routes: _routes,
        onGenerateRoute: (settings) {
          return material.MaterialPageRoute(
            builder: (context) => const Page404(),
          );
        },
      );
    }
  }
}
