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
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  'Playlist ${index + 1}',
                  style: const TextStyle(color: Colors.white54)
              ),
            );
          },
        ),
      )
    );
  }
}
