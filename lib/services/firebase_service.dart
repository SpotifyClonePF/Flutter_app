import 'package:Sound2U/models/data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

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
String nameUser = "root";

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
      nameUser = name;
    }
    if (queryNombre.docs.isNotEmpty == true) {
      exit = true;
      nameUser = name;
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
    DocumentSnapshot query = await collectionReferenceUser.doc(filename).get();
    if (query.exists) {
      Map<String, dynamic>? data = query.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey(tipo)) {
        CampoData = data[tipo];
      }
    }
  } catch (e) {
    return CampoData;
  }
  return CampoData;
}

Future<String> getImageOfFile(String filename) async {
  String ImgData = "Img/" + filename + ".jpg";
  print(ImgData);
  print(filename + "*********************************************************");
  String imageUrl =
      await FirebaseStorage.instance.ref().child(ImgData).getDownloadURL();

  return imageUrl;
}

// obetener lista de storage
Future<List<Song>> getFilesList() async {
  ListResult result =
      await FirebaseStorage.instance.ref().child('music').listAll();

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
    String titles = await getInformationOfFile(name, "title");
    final player = AudioPlayer();
    try {
      Song song = Song(
        id: Url,
        title: await getInformationOfFile(name, "title"),
        imageURL:
            await getImageOfFile(await getInformationOfFile(name, "title")),
        artist: await getInformationOfFile(name, "artist"),
        album: await getInformationOfFile(name, "album"),
        duration: await getAudioDuration(Url),
      );
      exx.add(song);
    } catch (e) {
      Song song = Song(
        id: Url,
        title: "lol",
        imageURL:
            "https://firebasestorage.googleapis.com/v0/b/dyzr-541db.appspot.com/o/Img%2FEstopa.jpg?alt=media&token=35360aa9-9592-48de-a71e-ce3bfcbe0757",
        artist: "lol",
        album: "lol",
        duration: "lol",
      );
      exx.add(song);
    }
    print("-----------------------------------------");
    print(Url);
    print(name);
    print(await getAudioDuration(Url));
  }
  return list;
}

Future<String> getAudioDuration(String filePath) async {
  AudioPlayer player = AudioPlayer();
  Duration duration = Duration();
  await player.setUrl(filePath);
  int durationInMilliseconds = await player.getDuration();
  duration = Duration(milliseconds: durationInMilliseconds);
  String formattedDuration = formatDuration(duration);
  print(formattedDuration);
  return formattedDuration;
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

Future<bool> createPlayList(String name) async {
  CollectionReference collectionReferenceUser = db.collection(nameUser);
  try {
    DocumentSnapshot documentSnapshot =
        await collectionReferenceUser.doc(name).get();
    if (documentSnapshot.exists) {
      return false;
    }
  } catch (e) {
    return false;
  }
  await FirebaseFirestore.instance.collection(nameUser).doc(name).set({});
  return true;
}

Future<bool> playListAddSong(String name, String nameSong) async {
  CollectionReference collectionReferenceUser = db.collection(nameUser);
  try {
    DocumentSnapshot<Object?> querySnapshot =
        await collectionReferenceUser.doc(name).get();
    Map<String, dynamic>? data = querySnapshot.data() as Map<String, dynamic>?;
    if (data!.containsKey(nameSong)) {
      return false;
    }
  } catch (e) {
    return false;
  }
  await FirebaseFirestore.instance.collection(nameUser).doc(name).update({
    nameSong: true,
  });
  return true;
}

Future<List?> readPlayList() async {
  CollectionReference collectionReferenceUser = db.collection(nameUser);
  List<QueryDocumentSnapshot> documents = [];
  try {
    QuerySnapshot querySnapshot = await collectionReferenceUser.get();
    documents = querySnapshot.docs;
  } catch (e) {
    return null;
  }
  List<Map<String, dynamic>> playlists = [];
  for (var document in documents) {
    Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
    playlists.add(data!);
  }
  return playlists;
}

Future<Map<String, List>> getAllFields() async {
  List<Map<String, dynamic>>? playlists =
      (await readPlayList())!.cast<Map<String, dynamic>>();
  Map<String, List> fieldsMap = {};
  for (var playlist in playlists!) {
    String playlistName = playlist['name'];
    List fields = [];
    playlist.forEach((key, value) {
      fields.add('$key');
    });
    fieldsMap[playlistName] = fields;
  }
  return fieldsMap;
}

Future<List<String>> getFieldKeysByName(String playlistName) async {
  CollectionReference collectionReferenceUser = db.collection(nameUser);
  List<String> fieldKeys = [];
  try {
    DocumentSnapshot documentSnapshot =
        await collectionReferenceUser.doc(playlistName).get();
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    fieldKeys = data.keys.toList();
  } catch (e) {
    return [];
  }
  return fieldKeys;
}

Future<List<String>> getPlaylistName() async {
  CollectionReference collectionReferenceUser = db.collection(nameUser);
  List<String> playlists = [];
  try {
    QuerySnapshot querySnapshot = await collectionReferenceUser.get();
    for (var document in querySnapshot.docs) {
      playlists.add(document.id);
    }
  } catch (e) {
    return [];
  }
  return playlists;
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
