import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/services/firebase_service.dart';
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
                  height: 160); // 70 sin el player y 160 si esta el player
            }
            final song = _songs[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                dense: true,
                leading: Image.asset(
                  "assets/icons/lofi.png",
                  fit: BoxFit.cover,
                  width: 55,
                  height: 55,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
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
            );
          },
        ),
      ),
    );
  }

  void searchSong(String query) {
    final suggestions = lofihiphopMusic.where((song) {
      final songTitle = song.title.toLowerCase();
      final songArtist = song.artist.toLowerCase();
      final input = query.toLowerCase();

      return songTitle.contains(input) || songArtist.contains(input);
    }).toList();

    setState(() => _songs = suggestions);
  }
}

/*
SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Column(
            children: [
              /// Busquedas recientes
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent searches',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                              color: MyColors.mainGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FixedColumnWidth(55),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(35),
                      },
                      children: List.generate(
                        5,
                        (index) {
                          return TableRow(
                            children: [
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(songs[index]['img']),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      songs[index]['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      songs[index]['artist'],
                                      style: const TextStyle(
                                        color: MyColors.mainGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ],
                          );
                        },
                      ).expand((row) => [
                        row,
                        const TableRow(
                          children: [
                            Divider(height: 40, color: Colors.white),
                            Divider(color: Colors.white),
                            Divider(color: Colors.white),
                          ],
                        ),
                      ]).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
 */