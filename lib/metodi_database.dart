import 'package:flutter/material.dart';
import '../home_business.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_database.dart';

Future<void> addUser(users, email) {
  String uid = getUid();
  return users
      .doc(uid)
      .set({
        'Uid': uid,
        'Email': email,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

String getUid() {
  var currentUser = FirebaseAuth.instance.currentUser;
  return currentUser!.uid;
}

Future<void> addBusiness(business, partitaIva, numerodiTelefono, indirizzo,
    orarioApertura, orarioChiusura) {
  String uid = getUid();
  return business
      .doc(uid)
      .set({
        'Uid': uid,
        'Partita Iva': partitaIva,
        'Numero di telefono': numerodiTelefono,
        'Indirizzo': indirizzo,
        'Orario di apertura': orarioApertura,
        'Orario di chiusura': orarioChiusura
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> addpoint(utente, produttore) {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  print('uid utente= ' + utente);
  print('uid produttore= ' + produttore);
  return users
      .doc(utente)
      .update({produttore: FieldValue.increment(1)})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
Future<bool> verifyBusiness()async {
  String uid = getUid();
  final snapShot = await FirebaseFirestore.instance
      .collection('business')
      .doc(uid) // varuId in your case
      .get();

  if (snapShot == null || !snapShot.exists) {
    return Future<bool>.value(false);
  }
  return Future<bool>.value(true);
  }