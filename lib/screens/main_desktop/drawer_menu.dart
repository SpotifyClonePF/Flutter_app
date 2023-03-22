import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/screens/main_desktop/drawer_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bool isExpanded = MediaQuery.of(context).size.height > 450;

    return Container(
      height: double.infinity,
      width: 280,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
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
              const SizedBox(height: 10),
              const Divider(
                color: Colors.white54,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(height: 10),

              /// Playlists
              if (isExpanded) SizedBox(
                height: MediaQuery.of(context).size.height - 450,
                child: _LibraryPlaylists(),
              ),
              /*SizedBox(
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
              ),*/
            ],
          ),
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
    return SizedBox(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Playlists',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.add,
                          color: Colors.red,
                        ),
                    ),
                  ],
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
