import 'package:Sound2U/models/current_track_model.dart';
import 'package:Sound2U/models/data.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          const CurrentTrack(),
        ],
      ),
    );
  }
}

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            _MoreControlls(),
          ],
        ),
      ),
    );
  }
}

class _MoreControlls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.devices_outlined, color: Colors.white),
          iconSize: 20,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined, color: Colors.white),
            ),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.fullscreen_outlined, color: Colors.white),
          iconSize: 20,
        ),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle, color: Colors.white),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon:
                  const Icon(Icons.skip_previous_outlined, color: Colors.white),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outlined, color: Colors.white),
              iconSize: 34,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined, color: Colors.white),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat, color: Colors.white),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text('0:00',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white)),
            const SizedBox(width: 8),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/icons/lofi.png',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 12,
                    color: Colors.grey[300],
                  ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
      ],
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
                        color: Colors.black87,
                      ),
                      child: MoveWindow()),
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                    ),
                    child: const WindowButtons()),
              ],
            ),
          ),
          const Expanded(
            child: PlaylistScreen(playlist: lofihiphopPlaylist),
          ),
        ],
      ),
    );
  }
}
