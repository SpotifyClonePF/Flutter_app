import 'package:Sound2U/screens/main_desktop/drawer_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  DrawerMenuState createState() => DrawerMenuState();
}

class DrawerMenuState extends State<DrawerMenu> {
  double _drawerWidth = 260.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _drawerWidth,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _drawerWidth = (_drawerWidth + details.delta.dx).clamp(230.0, 400);
          });
        },
        child: Drawer(
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 50),

                    /// User info
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 5,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white24,
                          child: Icon(
                            CupertinoIcons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Username',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      color: Colors.white54,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 5),

                    /// Menu options
                    Column(
                      children: const [
                        InfoCard(title: "Home", icon: CupertinoIcons.home),
                        InfoCard(title: "Playlists", icon: CupertinoIcons.play),
                        InfoCard(title: "Upload song", icon: CupertinoIcons.arrow_up_circle_fill),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.white54,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(height: 10),

                    /// Playlists
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                'Playlist con nombre largo numero ${index + 1}',
                                style: const TextStyle(color: Colors.white54, overflow: TextOverflow.ellipsis)
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
