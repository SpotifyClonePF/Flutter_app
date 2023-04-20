import 'package:Sound2U/models/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_ffmpeg/media_information.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// lista de canco
/*
Future<List> getCanco() async {
  List canco = [];
  CollectionReference collectionReferenceCanco = db.collection('canco');
  QuerySnapshot queryCanco = await collectionReferenceCanco.get();
  queryCanco.docs.forEach((documento) {
    canco.add(documento.data());
  });
  await Future.delayed(const Duration(seconds: 5));
  return canco;
}*/

// verficar usuario
Future<bool> getPeople(String name, String password) async {
  bool exit = false;
  CollectionReference collectionReferenceUser = db.collection('user');
  try {
    QuerySnapshot queryEmail = await collectionReferenceUser
        .where('email', isEqualTo: name)
        .where('password', isEqualTo: password)
        .get();
    QuerySnapshot queryNombre = await collectionReferenceUser
        .where('name', isEqualTo: name)
        .where('password', isEqualTo: password)
        .get();

    if (queryEmail.docs.isNotEmpty == true) {
      exit = true;
    }
    if (queryNombre.docs.isNotEmpty == true) {
      exit = true;
    }
  } catch (e) {
    return exit;
  }
  return exit;
}



// register usuario
Future<bool> existUser(String name, String email, String password) async {
  CollectionReference collectionReferenceUser = db.collection('user');
  try {
    QuerySnapshot queryEmail =
        await collectionReferenceUser.where('email', isEqualTo: email).get();
    QuerySnapshot queryNombre =
        await collectionReferenceUser.where('name', isEqualTo: name).get();
    if (queryEmail.docs.isNotEmpty == true ||
        queryNombre.docs.isNotEmpty == true) {
      return false;
    }
  } catch (e) {
    return false;
  }
  await FirebaseFirestore.instance.collection('user').doc(name).set({
    'name': name,
    'email': email,
    'password': password,
  });
  return true;
}

Future<String> getInformationOfFile(String filename, String tipo) async {
   String CampoData = "";
  CollectionReference collectionReferenceUser = db.collection('music');
  try {
    QuerySnapshot query = await collectionReferenceUser.doc(filename).get();
    if (query.exists) {
    Map<String, dynamic> data = query.data();
    if (data.containsKey(tipo)) {
      CampoData = data[tipo];
    }
  }
  } catch (e) {
    return CampoData;
  }
  return CampoData;
}

// obetener lista de storage
Future<List<Song>> getFilesList() async {
  ListResult result = await FirebaseStorage.instance.ref().listAll();

  List<Song> list = [];
  for (var prefix in result.prefixes) {
    // The prefixes under storageRef.
    // You can call listAll() recursively on them.
  }
  for (var item in result.items) {
    // The items under storageRef.

    final Url = await item.getDownloadURL();
    final name = item.name.toString();
    //final duration = await getDuration(Url);

    Song song = Song(
      id: Url,
      title: getInformationOfFile(name,"title"),
      artist: getInformationOfFile(name,"artist"),
      album: name,
      duration: getInformationOfFile(name,"duration"),
    );
    list.add(song);
    print("-----------------------------------------");
    print(Url);
    print(name);
  }
  return list;
}

Future<String> getDuration(String url) async {
  final FlutterFFprobe flutterFFprobe = new FlutterFFprobe();
  MediaInformation mediaInformation =
      await flutterFFprobe.getMediaInformation(url);
  final duration = mediaInformation.getMediaProperties()?['duration'];
  return duration;
}

// obtener url descargar de music
Future<String> _loadAudioUrl(String nombre) async {
  final storageRef = FirebaseStorage.instance.ref(nombre);
  final downloadUrl = await storageRef.getDownloadURL();
  if (downloadUrl.isNotEmpty) {
    return downloadUrl;
  }
  return "";
}

// obtener direccion(encaso solo android) par guardar la music.
Future<String> _getsavepath(String nombre) async {
  final appDocumentsDirectory = await getExternalStorageDirectory();
  if (appDocumentsDirectory != null) {
    return '${appDocumentsDirectory.path}/$nombre';
  }
  return "";
}
