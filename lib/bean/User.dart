import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

class FileStorage {
  Future<File> get _localFile async {
    if (Platform.isWindows) {
      final directory = await getDownloadsDirectory();
      print(directory);
      if (directory == null) {
        throw FileSystemException('External storage directory not available');
      }
      return File('${directory.path}/user.json');
    } else {
      final directory = await getExternalStorageDirectory();
      print(directory);
      if (directory == null) {
        throw FileSystemException('External storage directory not available');
      }
      return File('${directory.path}/user.json');
    }
  }

  Future<void> saveUser(User user) async {
    final file = await _localFile;
    await file.writeAsString(jsonEncode(user.toJson()));
  }

  Future<User?> loadUser() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        return null;
      }
      final contents = await file.readAsString();
      return User.fromJson(jsonDecode(contents));
    } catch (e) {
      return null;
    }
  }
}
