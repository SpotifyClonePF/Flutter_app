import 'package:Sound2U/models/data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import 'seekbar.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = exx[0];

  @override
  void initState() {
    super.initState();
    audioPlayer.setUrl(song.id);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration, SeekBarData>(
        audioPlayer.onAudioPositionChanged,
        audioPlayer.onDurationChanged,
        (position, duration) {
          return SeekBarData(
            position,
            duration ?? Duration.zero,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MusicPlayer(
        seekBarDataStream: _seekBarDataStream,
        audioPlayer: audioPlayer,
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  final Stream<SeekBarData> seekBarDataStream;
  final AudioPlayer audioPlayer;

  const _MusicPlayer({
    Key? key,
    required this.seekBarDataStream,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<SeekBarData>(
              stream: seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return Column(
                  children: [
                    SeekBar(
                      position: positionData?.position ?? Duration.zero,
                      duration: positionData?.duration ?? Duration.zero,
                      onChangeEnd: audioPlayer.seek,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
