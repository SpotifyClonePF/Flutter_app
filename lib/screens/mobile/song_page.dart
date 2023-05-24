import 'package:Dyzr/models/data.dart';
import 'package:Dyzr/styles/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  final Song song;
  const SongPage({Key? key, required this.song}) : super(key: key);

  @override
  State<SongPage> createState() => SongPageState();
}

class SongPageState extends State<SongPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.play(widget.song.id);
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    await audioPlayer.setUrl(widget.song.id);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Close button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),

              /// Song image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.song.imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              /// Song title
              Text(
                widget.song.title,
                style: const TextStyle(
                  fontSize: 24,
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              /// Song artist
              Text(
                widget.song.artist,
                style: const TextStyle(
                  fontSize: 20,
                  color: MyColors.mainGreen,
                ),
              ),
              const SizedBox(height: 20),

              /// Song slider
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 4,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 5,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 15,
                  ),
                ),
                child: Slider(
                  activeColor: MyColors.mainGreen,
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  },
                ),
              ),

              /// Song time
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      formatTime(duration),
                      style: const TextStyle(
                        color: MyColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              /// Song controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.repeat,
                    ),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_previous,
                    ),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () async {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: MyColors.mainGreen,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(widget.song.id);
                          }
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_next,
                    ),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shuffle_outlined,
                    ),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () async {},
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// Song options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.cloud_download_outlined,
                    ),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                    ),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () async {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.playlist_add_sharp,
                    ),
                    color: Colors.white,
                    iconSize: 35,
                    onPressed: () async {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}
