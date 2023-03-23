import 'package:firedart/firedart.dart';

Future<bool> getPeopleWindows(String name, String password) async {
  CollectionReference collect = Firestore.instance.collection('user');
  bool exit = false;
  try {
    List<Document> queryEmail = await collect
        .where('email', isEqualTo: name)
        .where('password', isEqualTo: password)
        .get();
    List<Document> queryNombre = await collect
        .where('name', isEqualTo: name)
        .where('password', isEqualTo: password)
        .get();

    if (queryEmail.isNotEmpty == true) {
      exit = true;
    }
    if (queryNombre.isNotEmpty == true) {
      exit = true;
    }
  } catch (e) {
    return exit;
  }
  return exit;
}

Future<bool> existUserWindows(
    String name, String email, String password) async {
  print("AAAA");
  CollectionReference collectionReferenceUser =
      Firestore.instance.collection('user');
  try {
    List<Document> queryEmail =
        await collectionReferenceUser.where('email', isEqualTo: email).get();
    List<Document> queryNombre =
        await collectionReferenceUser.where('name', isEqualTo: name).get();
    if (queryEmail.isNotEmpty == true || queryNombre.isNotEmpty == true) {
      return false;
    }
  } catch (e) {
    return false;
  }
  await Firestore.instance.collection('user').document(name).set({
    'name': name,
    'email': email,
    'password': password,
  });
  return true;
}
