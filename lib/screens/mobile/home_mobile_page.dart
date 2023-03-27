import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'tabs/home_page.dart';
import 'tabs/page2_page.dart';
import 'tabs/page3_page.dart';
import 'tabs/page4_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  // List of pages to be displayed
  final List<Widget> _tabs = [
    const Home(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGray,
      body: _tabs[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          backgroundColor: MyColors.lightBlack,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
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
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Page 4'
            ),
          ],
          selectedItemColor: MyColors.orange,
          unselectedItemColor: MyColors.white,
        ),
      ),
    );
  }
}
