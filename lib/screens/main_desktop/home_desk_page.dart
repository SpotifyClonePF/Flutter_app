import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: const Center(
          child: Text(
            'Home Desktop',
            style: TextStyle(
              color: MyColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
