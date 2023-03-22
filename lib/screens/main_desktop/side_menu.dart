import 'package:Sound2U/models/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer_tiles.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

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
            Column(
              children: [
                InfoCard(
                  title: "Home",
                  icon: CupertinoIcons.home,
                  onTap: () {},
                ),
                InfoCard(
                  title: "Playlists",
                  icon: CupertinoIcons.play,
                  onTap: () {},
                ),
                InfoCard(
                  title: "Upload song",
                  icon: CupertinoIcons.arrow_up_circle_fill,
                  onTap: () {},
                ),
              ],
            ),
            _LibraryPlaylists(),
          ],
        ),
      ),
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  @override
  _LibraryPlaylistsState createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<_LibraryPlaylists> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'PLAYLISTS',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          onTap: () {},
                        ))
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
