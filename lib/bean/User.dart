import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class LoginInfo {
  String? username;
  String? password;

  LoginInfo(this.username, this.password);

  LoginInfo.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}

class LoginDataStorage {
  Future<File> get _loginDataFile async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw FileSystemException('External storage directory not available');
    }
    return File('${directory.path}/login_data.json');
  }

  Future<LoginInfo?> readLoginInfo() async {
    try {
      final file = await _loginDataFile;
      if (!await file.exists()) {
        return null;
      }
      final contents = await file.readAsString();
      final json = jsonDecode(contents); // 解码为Map
      final loginInfo = LoginInfo.fromJson(json); // 转换为LoginInfo对象
      return loginInfo;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveLoginInfo(LoginInfo info) async {
    final file = await _loginDataFile;
    await file.writeAsString(info.toJson().toString());
  }
}
