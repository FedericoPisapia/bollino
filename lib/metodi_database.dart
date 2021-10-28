import 'package:flutter/material.dart';
import '../lettore_qr_cliente.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_database.dart';

Future<void> addUser(users, email) {
  String uid=getUid();
  return users.doc(uid)
      .set({
    'Uid' : uid,
    'Email': email, // John Doe
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
String getUid(){
  var currentUser = FirebaseAuth.instance.currentUser;
  return currentUser!.uid;
}