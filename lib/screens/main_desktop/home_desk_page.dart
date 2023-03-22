import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';

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
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const DrawerMenu(),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Home',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 85,
                width: double.infinity,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Play Bar',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}