import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final fireBaseStoragesProvider = Provider((ref) {
  return FireBaseStorges(firebaseStorge: FirebaseStorage.instance);
});

class FireBaseStorges {
  final FirebaseStorage firebaseStorge;

  FireBaseStorges({required this.firebaseStorge});

  Future<String> storeFileToFireBase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorge.ref(ref).putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
