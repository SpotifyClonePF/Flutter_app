import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: const BoxDecoration(
              color: MyColors.lightBlack,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              children: const [
                SizedBox(
                  height: 36,
                  width: 36,
                  child: RiveAnimation.asset(
                    'assets/icons/rive.riv',
                    artboard: "AUDIO",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}