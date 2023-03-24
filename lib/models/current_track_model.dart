import 'package:flutter/material.dart';
import 'data.dart';

class CurrentTrackModel extends ChangeNotifier{
  Song? selected;

  void selectTrack(Song track){
    selected = track;
    notifyListeners();
  }
}