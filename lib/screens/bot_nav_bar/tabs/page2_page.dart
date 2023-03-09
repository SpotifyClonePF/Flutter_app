import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGray,
      body: Stack(
        children: <Widget>[
          // Segundo container
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 4,
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text("Segundo Container"),
              ),
            ),
          ),
          // Primer container
          Positioned(
            top: MediaQuery.of(context).size.height / 4 - MediaQuery.of(context).size.height / 16,
            left: 0,
            right: MediaQuery.of(context).size.width / 2,
            height: 50,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Center(
                child: Text("LOGIN"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

