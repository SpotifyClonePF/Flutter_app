import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:Sound2U/responsive.dart';
import 'package:Sound2U/screens/mobile/home_mobile_page.dart';
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
            if (snapshot.hasData) {
              if (!kIsWeb && Responsive.isDesktop(context)) {
                return HomeDesktopPage();
              } else {
                return HomeMobilePage();
              }
            } else {
              return Login();
            }
          }),
    );
  }
}
