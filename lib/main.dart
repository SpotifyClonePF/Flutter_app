import 'dart:io';
import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/screens/mobile/playlists_page.dart';
import 'package:Sound2U/screens/mobile/song_page.dart';
import 'package:Sound2U/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'package:firedart/firedart.dart';
import 'models/current_track_model.dart';
import 'screens/routes.dart';
import 'styles/colors.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';

const projectId = 'dyzr-541db';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  runApp(
    material.MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CurrentTrackModel(),
        child: const MyApp(),
      ),
    ),
  );

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    doWhenWindowReady(() {
      final win = appWindow;
      win.size = const Size(1300, 720);
      win.minSize = const Size(815, 650);
      win.alignment = Alignment.center;
      win.title = "Dyzr";
      win.show();
    });
  }

  await getFilesList();
}

Future<void> requestPermission() async {
  await [Permission.storage].request();
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
    '/home': (context) => const HomeMobilePage(),
    '/home_desk': (context) => const HomeDesktopPage(),
    '/profileMobile': (context) => const ProfileMobile(),
    '/song_page': (context) => SongPage(
          song: ModalRoute.of(context)?.settings.arguments as Song,
        ),
    '/appearance': (context) => const Appearance(),
    '/playlists_page': (context) => const PlaylistsPage(),
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.lightBlack,
    ));

    return material.MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sound2U',
      theme: material.ThemeData(
        scrollbarTheme: material.ScrollbarThemeData(
          thumbColor: material.MaterialStateProperty.all(MyColors.lightBlack),
        ),
      ),
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
