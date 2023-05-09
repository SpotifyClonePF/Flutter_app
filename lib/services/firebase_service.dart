import 'package:Sound2U/models/data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<void> myFunction() async {
  final response = await http.post(
    Uri.parse('https://example.com/'),
    headers: {'X-Firebase-Locale': 'en-US'},
    body: {'foo': 'bar'},
  );
  print(response.body);
}

FirebaseFirestore db = FirebaseFirestore.instance;

// verficar usuario
String nameUser = "root";
String emailUser = "root";
String userimg =
    "https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/user%2Fdefault.png?alt=media&token=b8f316e2-8bee-4f10-8957-eb9e2c7325b8";

Future<String> getPeople(String email) async {
  String name = "";
  CollectionReference collectionReferenceUser = db.collection('user');
  try {
    DocumentSnapshot query = await collectionReferenceUser.doc(email).get();
    if (query.exists) {
      Map<String, dynamic>? data = query.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('name')) {
        name = data['name'];
      }
    }
  } catch (e) {
    return name;
  }
  return name;
}

Future<bool> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = await FirebaseAuth.instance.currentUser;
    print("/////");
    print(user);
    if (user != null && !user.emailVerified) {
      try {
        user.updateDisplayName(email);
        await user.sendEmailVerification();
        print('Verification email sent to ${user.email}');
      } catch (e) {
        print('Failed to send verification email. Error: $e');
        print('2222');
      }
    }
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print("Password is too weak");
    } else if (e.code == 'email-already-in-use') {
      print("An account already exists for that email.");
    } else {
      print(e.message);
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> signIn(String email, String password) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    print("/////");
    print(user);

    if (user == null) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    }
    await user?.reload();
    user = await FirebaseAuth.instance.currentUser;
    print("/////");
    print(user);
    if (user == null) {
      print("user hasn't verified email");
      return false;
    } else {
      print("user HAS verfied email & is signed in");
      nameUser = await getPeople(email);
      emailUser = email;
      await getPlayList();
      await getImageProfile(emailUser);

      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print("No user found for that email");
    } else if (e.code == 'wrong-password') {
      print("Wrong password provided for that user.");
    } else {
      print(e.message);
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {}
  return false;
}

Future<void> getImageProfile(String username) async {
  String ImgData = "user/" + username + ".png";
  print(ImgData);
  print(username + "*********************************************************");
  try {
    String imageUrl =
        await FirebaseStorage.instance.ref().child(ImgData).getDownloadURL();
    userimg = imageUrl;
  } catch (e) {}
}

// register usuario
Future<bool> existUser(String name, String email, String password) async {
  CollectionReference collectionReferenceUser = db.collection('user');
  try {
    QuerySnapshot queryEmail =
        await collectionReferenceUser.where('email', isEqualTo: email).get();
    if (queryEmail.docs.isNotEmpty == true) {
      return false;
    }
  } catch (e) {
    return false;
  }
  await FirebaseFirestore.instance.collection('user').doc(email).set({
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
  String ImgData = "img/" + filename + ".jpg";
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
            "https://firebasestorage.googleapis.com/v0/b/dyzr-proyect.appspot.com/o/img%2FAnimals.png?alt=media&token=e085b8cc-36bf-4b2b-889e-9fff1d7aac35",
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

Future<String> getImageOfPlayList(String listname) async {
  String ImgData = emailUser + "/" + listname + ".jpg";
  print(ImgData);
  print(listname + "*********************************************************");
  String imageUrl =
      await FirebaseStorage.instance.ref().child(ImgData).getDownloadURL();

  return imageUrl;
}

Future<void> getPlayList() async {
  List<String> lists = await getPlaylistName();
  for (String list in lists) {
    String imageURL = await getImageOfPlayList(list);
    playlist.add({
      'name': list,
      'imageURL': imageURL,
      'artist': 'aa',
    });
  }
  print(playlist);
}

Future<void> playlistOfUser() async {
  List<String> listname = await getPlaylistName();
  for (String playlistname in listname) {
    //songs.add(await getFieldKeysByName(playlistname));
  }
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
  CollectionReference collectionReferenceUser = db.collection(emailUser);
  try {
    DocumentSnapshot documentSnapshot =
        await collectionReferenceUser.doc(name).get();
    if (documentSnapshot.exists) {
      return false;
    }
  } catch (e) {
    return false;
  }
  await FirebaseFirestore.instance.collection(emailUser).doc(name).set({});
  return true;
}

Future<bool> playListAddSong(String name, String nameSong) async {
  CollectionReference collectionReferenceUser = db.collection(emailUser);
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
  await FirebaseFirestore.instance.collection(emailUser).doc(name).update({
    nameSong: true,
  });
  return true;
}

Future<List<String>> getFieldKeysByName(String playlistName) async {
  CollectionReference collectionReferenceUser = db.collection(emailUser);
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
  CollectionReference collectionReferenceUser = db.collection(emailUser);
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
