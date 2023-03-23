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
