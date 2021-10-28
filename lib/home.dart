import 'package:flutter/material.dart';
import '../lettore_qr_cliente.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ElevatedButton(onPressed: ()  async { await  FirebaseAuth.instance.signOut();
      setState(()  {
      });

    }, child: Text('sing out')));
  }
}
