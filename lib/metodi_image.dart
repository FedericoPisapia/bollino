import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import '../metodi_database.dart';

final picker = ImagePicker();

Future<void> Upload() async {
  String path= 'loghi/Logo_'+ getUid()+ '';
  final imgPicker = ImagePicker();
  XFile? imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
  File file = File(imgGallery!.path);
  try {
    await firebase_storage.FirebaseStorage.instance
        .ref(path)
        .putFile(file);
    var url = await downloadURL().toString();
    print(url);

  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
  }
}


Future<String> downloadURL() async {
  String path= 'loghi/Logo_'+ getUid()+ '';
  String downloadURL = await firebase_storage.FirebaseStorage.instance
      .ref(path)
      .getDownloadURL();
  print(downloadURL);
  addUrl(downloadURL);
  return downloadURL.toString();
}