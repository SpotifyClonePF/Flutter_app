import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerButton extends StatefulWidget {
  final String url;

  const AudioPlayerButton({Key? key, required this.url}) : super(key: key);

  @override
  _AudioPlayerButtonState createState() => _AudioPlayerButtonState();
}

class _AudioPlayerButtonState extends State<AudioPlayerButton> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  void _playAudio() async {
    int result = await _audioPlayer.play(widget.url);
    if (result == 1) {
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _pauseAudio() {
    _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying = !_isPlaying;
        });
        if (_isPlaying) {
          _playAudio();
        } else {
          _pauseAudio();
        }
      },
      child: Icon(
        _isPlaying ? Icons.pause : Icons.play_arrow,
        size: 50.0,
      ),
    );
  }
}
