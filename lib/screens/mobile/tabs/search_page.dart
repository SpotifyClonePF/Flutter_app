import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/screens/mobile/song_page.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  List<Song> _songs = exx;

  Future<void> _dialogFuture() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.darkGray,
          title: const Text('Coming soon', style: TextStyle(color: Colors.white),),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This feature is coming soon.', style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
                            Container(
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
                          _dialogFuture();
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
