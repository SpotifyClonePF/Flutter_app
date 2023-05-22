import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'models/data.dart';
import 'screens/mobile/song_page.dart';

class SpeechToTextWidget extends StatefulWidget {
  const SpeechToTextWidget({Key? key}) : super(key: key);

  @override
  SpeechToTextWidgetState createState() => SpeechToTextWidgetState();
}

class SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  List<Song> songs = exx;
  FlutterTts flutterTts = FlutterTts();
  late Song song;

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("en-US");
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      printtt();
    });
  }

  void printtt() {
    if (_speechToText.isNotListening) {
      print(_lastWords);

      if (_lastWords.contains("play")) {

        _lastWords = _lastWords.replaceAll("play ", "");
        print(_lastWords);
        flutterTts.speak("Playing $_lastWords");
        searchSong(_lastWords);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongPage(
              song: song,
            ),
          ),
        );

      }else{
        print("No song found");
        flutterTts.speak("Sorry, I don't understand you. Can u repeat?");
      }
    }
  }

  void searchSong(String query) {
    final suggestions = exx.where((song) {
      final songTitle = song.title.toLowerCase();
      final input = query.toLowerCase();

      return songTitle.contains(input);
    }).toList();

    setState(() => song = suggestions[0]);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _speechToText.isNotListening ? _startListening : _stopListening,
      tooltip: 'Listen',
      child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
    );
  }
}