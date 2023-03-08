import 'package:flutter/material.dart';

Widget createAppBar(String message){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(message),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(Icons.settings),
      )],
  );
}