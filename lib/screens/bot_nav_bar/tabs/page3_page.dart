import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.darkGray,
      body: Center(
        child: Text('Page 3', style: TextStyle(fontSize: 50, color: MyColors.white)),
      ),
    );
  }
}