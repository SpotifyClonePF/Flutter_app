import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.darkGray,
                MyColors.darkGray,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Image.asset("assets/icons/logo_no_fondo.png"),
                    ),
                    ListTile(
                      onTap: () {},
                      horizontalTitleGap: 0.0,
                      leading: const Icon(
                        Icons.home,
                        color: Colors.white54,
                        size: 16,
                      ),
                      title: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Home',
                          style: TextStyle(color: Colors.white54),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
