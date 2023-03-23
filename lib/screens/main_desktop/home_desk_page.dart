import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'my_window.dart';
import 'playlist_screen.dart';

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
      backgroundColor: MyColors.lightBlack,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                DrawerMenu(),
                RightSide(),
              ],
            ),
          ),
          Container(
            height: 84,
            width: double.infinity,
            color: Colors.white12,
          ),
        ],
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: MoveWindow()),
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: const WindowButtons()),
              ],
            ),
          ),
          Expanded(
            child: PlaylistScreen(playlist: lofihiphopPlaylist),
          ),
        ],
      ),
    );
  }
}