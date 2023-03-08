import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.darkGray,
              MyColors.darkGray,
              //Color(0xff414345)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        /*
        child: Column(
          children: [
            createAppBar('Good morning')
          ],
        ),
        */
      )
    );
  }
}
