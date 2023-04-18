import 'package:Sound2U/screens/bot_nav_bar/menu_page.dart';
import 'package:Sound2U/screens/login/login_prueba.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Sound2U/responsive.dart';
import 'package:Sound2U/screens/main_desktop/home_desk_page.dart';
import 'package:flutter/foundation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print("xxxxxxxx");
            if (snapshot.hasData) {
              if (!kIsWeb && Responsive.isDesktop(context)) {
                print("1111");
                return HomeDesktopPage();
              } else {
                print("222");
                return MenuPage();
              }
            } else {
              print("333");
              return Login();
            }
          }),
    );
  }
}
