import 'package:flutter/material.dart';
import '../home_business.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_image.dart';

Future<void> addUser(users, email, UserName) {
  String uid = getUid();
  Map<String, dynamic> Mymap = <String, dynamic>{};
  return users
      .doc(uid)
      .set({
        'Uid': uid,
        'Email': email,
        'UserName': UserName,
        'Business': Mymap,
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

String getUid() {
  var currentUser = FirebaseAuth.instance.currentUser;
  return currentUser!.uid;
}

Future<void> addBusiness(business, partitaIva, numerodiTelefono, indirizzo,
    orarioApertura, orarioChiusura) async{
  String uid = getUid();

  return business
      .doc(uid)
      .set({
        'Uid': uid,
        'Partita Iva': partitaIva,
        'Numero di telefono': numerodiTelefono,
        'Indirizzo': indirizzo,
        'Orario di apertura': orarioApertura,
        'Orario di chiusura': orarioChiusura,
        'URL_Logo': ''
      })
      .then((value) => print("User business"))
      .catchError((error) => print("Failed to add business: $error"));
}

Future<void> addpoint(utente, produttore) {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  print('uid utente= ' + utente);
  print('uid produttore= ' + produttore);
  return users
      .doc(utente)
      .update({"Business. "+ produttore: FieldValue.increment(1)})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void> addURL(url) {
  final CollectionReference business =
  FirebaseFirestore.instance.collection('business');

  return business
      .doc(getUid())
      .update({"URL_Logo": url})
      .then((value) => print("business Updated"))
      .catchError((error) => print("Failed to update business: $error"));
}


Future<bool> verifyBusiness() async {
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

Future<String> getUrlLogo() async {
  String uid = getUid();
  final snapShot = await FirebaseFirestore.instance
      .collection('business')
      .doc(uid) // varuId in your case
      .get();
    return snapShot.data()!['URL_Logo'].toString();
}

Future<bool> verifyUsers(uid) async {
  print(uid);
  final snapShot = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid) // varuId in your case
      .get();

  if (snapShot == null || !snapShot.exists) {
    return Future<bool>.value(false);
  }
  return Future<bool>.value(true);
}

Future<String> getUserEmail(uid) async {
  final snapShot = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid) // varuId in your case
      .get();
  return snapShot['Email'];
}

Future<void> addUrl(url) async {
  final CollectionReference business =
  FirebaseFirestore.instance.collection('business');

  return business
      .doc(getUid())
      .update({"URL_Logo": url})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}