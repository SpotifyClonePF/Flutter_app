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

// obetener lista de storage
/*
Future<ListResult> getFilesList() async {
  ListResult result = await FirebaseStorage.instance.ref().listAll();
  return result;
}*/

// obetener url descargar de music
/*
Future<String> _loadAudioUrl(String nombre) async {
  final storageRef = FirebaseStorage.instance.ref(nombre);
  final downloadUrl = await storageRef.getDownloadURL();
  if (downloadUrl.isNotEmpty) {
    return downloadUrl;
  }
  return "";
}*/

// obtener direccion(encaso solo android) par guardar la music.
/*
Future<String> _getsavepath(String nombre) async {
  final appDocumentsDirectory = await getExternalStorageDirectory();
  if (appDocumentsDirectory != null) {
    return '${appDocumentsDirectory.path}/$nombre';
  }
  return "";
}*/