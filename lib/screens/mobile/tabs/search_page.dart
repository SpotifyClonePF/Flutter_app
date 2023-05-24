import 'dart:ui';
import 'package:Dyzr/models/data.dart';
import 'package:Dyzr/screens/mobile/song_page.dart';
import 'package:Dyzr/styles/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  List<Song> _songs = exx;

  Future<void> addSongToPlaylist() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: MyColors.darkGray.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              child: ListBody(
                children: <Widget>[
                  /// Title Playlist
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Playlists',
                        style: TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  /// Playlists
                  SizedBox(
                    height: 350,
                    width: 300,
                    child: Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.normal),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                          mainAxisExtent: 175,
                        ),
                        itemCount: 12 + 1,
                        itemBuilder: (context, index) {
                          if (index == 12) {
                            return const SizedBox(
                                height:
                                    0); // 70 sin el player y 160 si esta el player
                          }
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: MyColors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/icons/lofi.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Playlist ${index + 1}',
                                style: const TextStyle(
                                  color: MyColors.white,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> optionSongs(Song song) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: MyColors.darkGray.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              child: ListBody(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(song.imageURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 5,
                        child: Container(
                          width: 80,
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 0,
                          ),
                          child: Text(
                            song.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Text(
                            song.artist.toUpperCase(),
                            style: const TextStyle(
                              color: MyColors.mainGreen,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Songs Name
                  const SizedBox(height: 30),

                  /// Add to playlist
                  InkWell(
                    onTap: () {
                      addSongToPlaylist();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: Colors.white, size: 30),
                        SizedBox(width: 5),
                        Text(
                          'Add to playlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// Add to liked songs
                  InkWell(
                    onTap: () {
/*Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const ProfileMobile(),
),
);*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.favorite_border,
                            color: Colors.white, size: 25),
                        SizedBox(width: 5),
                        Text(
                          'Add to liked songs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// View album
                  InkWell(
                    onTap: () {
/*Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const ProfileMobile(),
),
);*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.library_music_rounded,
                            color: Colors.white, size: 25),
                        SizedBox(width: 5),
                        Text(
                          'View album',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// View album
                  InkWell(
                    onTap: () {
/*Navigator.push(
context,

MaterialPageRoute(
builder: (context) => const ProfileMobile(),
),
);*/
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_download_sharp,
                            color: Colors.white, size: 25),
                        SizedBox(width: 5),
                        Text(
                          'Download song',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 80,
          title: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(color: Colors.white),
            onChanged: searchSong,
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          itemCount: _songs.length + 1,
          itemBuilder: (context, index) {
            if (index == _songs.length) {
              return const SizedBox(
                height: 160,
              ); // 70 sin el player y 160 si esta el player
            }
            final song = _songs[index];

            /*Future<void> showMyDialog() async {
              return showDialog<void>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.darkGray,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 400,
                      width: 300,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(40),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: MyColors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
              );
            }*/
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongPage(song: song),
                    ),
                  );
                },
                child: ListTile(
                  dense: true,
                  leading: Image.network(
                    song.imageURL,
                    fit: BoxFit.cover,
                    width: 55,
                    height: 55,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 190,
                              child: Text(
                                song.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              song.artist,
                              style: const TextStyle(
                                color: MyColors.mainGreen,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          optionSongs(song);
                        },
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void searchSong(String query) {
    final suggestions = exx.where((song) {
      final songTitle = song.title.toLowerCase();
      final songArtist = song.artist.toLowerCase();
      final input = query.toLowerCase();

      return songTitle.contains(input) || songArtist.contains(input);
    }).toList();

    setState(() => _songs = suggestions);
  }
}
