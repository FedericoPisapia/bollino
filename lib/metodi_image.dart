

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';


final picker = ImagePicker();

Future<void> _upload(String inputSource) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  final picker = ImagePicker();
  PickedFile? pickedImage;
  try {
    pickedImage = (await picker.pickImage(source: inputSource == 'camera'
            ? ImageSource.camera
            : ImageSource.gallery,
        maxWidth: 1920)) as PickedFile?;

    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);

    try {
      // Uploading the selected image with some custom meta data
      await storage.ref(fileName).putFile(
          imageFile,
          SettableMetadata(customMetadata: {
            'uploaded_by': 'A bad guy',
            'description': 'Some description...'
          }));

      // Refresh the UI
      //setState(() {});
    } on FirebaseException catch (error) {
      print(error);
    }
  } catch (err) {
    print(err);
  }
}