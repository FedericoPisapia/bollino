import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bollino/metodi_database.dart';

class HomeStream extends StatefulWidget {
  const HomeStream({Key? key}) : super(key: key);

  @override
  _HomeStreamState createState() => _HomeStreamState();
}

class _HomeStreamState extends State<HomeStream> {
  final Stream<DocumentSnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').doc(getUid()).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(35),
              child: Image.asset('images/logo.png'),
            ),
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: _usersStream,
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (snapshot.hasData) {
                Map<String, dynamic> items = snapshot.data!['Business'];
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(items.keys.elementAt(index).toString()),
                          subtitle: Text(
                            items.values.elementAt(index).toString(),
                          ));
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
