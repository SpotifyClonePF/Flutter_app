import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';


class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          'Page 4',
          style: TextStyle(
            color: MyColors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
