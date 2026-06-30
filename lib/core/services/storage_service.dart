import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage storage =
      FirebaseStorage.instance;

  Future<String> uploadProfileImage(
      File file,
      String uid) async {
    final ref =
        storage.ref().child("profile_images/$uid.jpg");

    await ref.putFile(file);

    return await ref.getDownloadURL();
  }
}