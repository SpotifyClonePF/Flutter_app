import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.darkGray,
      body: Center(
        child: Text('Page 2', style: TextStyle(fontSize: 50, color: MyColors.white)),
      ),
    );
  }
}
