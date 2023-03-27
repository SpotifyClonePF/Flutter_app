import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            color: MyColors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
