import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'tabs/home_page.dart';
import 'tabs/page2_page.dart';
import 'tabs/page3_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  // List of pages to be displayed
  final List<Widget> _tabs = [
    const Home(),
    Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.lightBlack,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Page 2'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),
        ],
        selectedItemColor: MyColors.orange,
        unselectedItemColor: MyColors.white,
      ),
    );
  }
}
