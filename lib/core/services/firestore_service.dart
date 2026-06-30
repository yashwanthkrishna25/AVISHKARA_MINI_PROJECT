import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<void> saveUser(
    String uid,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection("users").doc(uid).set(data);
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await firestore.collection("users").doc(uid).get();
  }

  Future<void> updateUser(
    String uid,
    Map<String, dynamic> data,
  ) async {
    await firestore.collection("users").doc(uid).update(data);
  }

  Future<void> deleteUser(String uid) async {
    await firestore.collection("users").doc(uid).delete();
  }
}