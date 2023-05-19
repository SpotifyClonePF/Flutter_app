import 'package:Dyzr/styles/colors.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class MusicWidget extends StatefulWidget {
  final Song song;
  final String imageUrl;

  const MusicWidget({
    super.key,
    required this.song,
    required this.imageUrl,
  });

  @override
  MusicWidgetState createState() => MusicWidgetState();
}

class MusicWidgetState extends State<MusicWidget> {
  bool _isPlaying = false;
  String _currentImageUrl = '';
  late Song _currentSong;

  @override
  void initState() {
    super.initState();
    _currentSong = widget.song;
    _currentImageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MyColors.lightBlack.withAlpha(505),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              _currentImageUrl,
            ),
            fit: BoxFit.cover,
            height: 60,
            width: 60,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Placeholder(
                fallbackHeight: 60,
                fallbackWidth: 60,
              );
            },
          ),
          const SizedBox(width: 10),
          Flexible(
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _currentSong.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _currentSong.artist,
                    style: const TextStyle(
                      fontSize: 14,
                      color: MyColors.mainGreen,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Agregar lógica para el botón de retroceder
                },
                icon: const Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Agregar lógica para el botón de avanzar
                },
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
