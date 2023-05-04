import 'package:Sound2U/models/current_track_model.dart';
import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({
    super.key,
    required this.playlist,
  });

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 35,
                  ),
                ),
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          const SizedBox(width: 8),
          IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.mainGreen,
              Colors.black,
            ],
            stops: [0, 0.3],
          ),
        ),
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            children: [
              PlaylistHeader(
                playlist: widget.playlist,
              ),
              const SizedBox(height: 40),
              TracksList(
                tracks: widget.playlist.songs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: Colors.white, fontSize: 12),
      dataRowHeight: 54,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE', style: TextStyle(color: Colors.white))),
        DataColumn(
            label: Text('ARTIST', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('ALBUM', style: TextStyle(color: Colors.white))),
        DataColumn(label: Icon(Icons.access_time, color: Colors.white)),
      ],
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle =
            TextStyle(color: selected ? MyColors.mainGreen : MyColors.white);
        return DataRow(
          cells: [
            DataCell(
              Text(e.title, style: textStyle),
            ),
            DataCell(
              Text(e.artist, style: textStyle),
            ),
            DataCell(
              Text(e.album, style: textStyle),
            ),
            DataCell(
              Text(e.duration, style: textStyle),
            ),
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(playlist.imageURL,
                height: 200, width: 200, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    playlist.name,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    playlist.description,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Created by ${playlist.creator} · ${playlist.songs.length} songs, ${playlist.duration}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;

  const _PlaylistButtons({
    super.key,
    required this.followers,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).iconTheme.color,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 12, letterSpacing: 2),
          ),
          child: const Text('PLAY', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.favorite_border, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.more_horiz, color: Colors.white),
        ),
        const Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
