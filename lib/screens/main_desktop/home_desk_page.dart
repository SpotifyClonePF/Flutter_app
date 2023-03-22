import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'side_menu.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Shell();
  }
}

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                DrawerMenu(),
                /// PlaylistScreen
              ],
            ),
          ),
          Container(
            height: 84,
            width: double.infinity,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
