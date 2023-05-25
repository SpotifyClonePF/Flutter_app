import 'package:Dyzr/services/firebase_service.dart' as firebaseservice;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../models/data.dart';
import '../screens/mobile/song_page.dart';

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
      voiceCommand();
    });
  }

  void voiceCommand() {
    if (_speechToText.isNotListening) {
      print(_lastWords);

      if (_lastWords.contains("play")) {
        _lastWords = _lastWords.replaceAll("play ", "");

        print(_lastWords);

        final suggestions = exx.where((song) {
          final songTitle = song.title.toLowerCase();
          final input = _lastWords.toLowerCase();

          return songTitle.contains(input);
        }).toList();

        if (suggestions.isNotEmpty) {
          song = suggestions[0];
          flutterTts.speak("Playing ${song.title}from ${song.artist}");
          flutterTts.setCompletionHandler(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongPage(
                  song: song,
                ),
              ),
            );
          });
        } else {
          print("No song found");
          flutterTts.speak("Sorry, I couldn't find the requested song.");
          flutterTts.setCompletionHandler(() {
            _lastWords = "";
            suggestions.clear();
          });
          _lastWords = "";
          suggestions.clear();
        }
      } else if (_lastWords.contains("hola") || (_lastWords.contains("hi"))) {
        print("Hi!!");
        flutterTts.speak("Hi ${firebaseservice.nameUser}, how can I help you?");

      } else if (_lastWords.contains("help") || (_lastWords.contains("ayuda") || (_lastWords.contains("commands")) || (_lastWords.contains("comandos")))) {
        print("Commands");
        flutterTts.speak("Available commands on version 1.0.0 are: play, hi and help.");

      } else {
        print("Invalid command");
        flutterTts.speak("Sorry, I don't understand you. Can you repeat?");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: _speechToText.isNotListening ? Colors.grey.shade500 : Colors.red,
          width: 1.5,
        ),
        color: Colors.white,
      ),
      child: FloatingActionButton(
        onPressed:
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        backgroundColor: Colors.black,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: _speechToText.isNotListening ? const EdgeInsets.all(6.5) : const EdgeInsets.all(3),
          child: Image.asset('assets/icons/logo_no_fondo.png'),
        ),
      ),
    );
  }
}