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
              margin: const EdgeInsets.all(25),
              child: Image.asset(
                'images/logo.png',
                height: 120,
              ),
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
              if (snapshot.hasData && snapshot.data!['Business'].toString()=='') {
                return Container();
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
                        title: Stack(children: [
                          Container(
                            child: Image.asset(
                              'images/tessera.jpg',
                              width: 500,
                              height: 200,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 55,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        0)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        1)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        2)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        3)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        4)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 55,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        5)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        6)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        7)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        8)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (int.parse(items.values
                                            .elementAt(index)
                                            .toString()) >
                                        9)
                                      Image.asset(
                                        'images/X.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                  ],
                                ),
                                if (int.parse(items.values
                                        .elementAt(index)
                                        .toString()) <=
                                    5)
                                  const SizedBox(
                                    height: 90,
                                  ),
                                if (int.parse(items.values
                                        .elementAt(index)
                                        .toString()) >
                                    5)
                                  const SizedBox(
                                    height: 40,
                                  ),
                                Text('' +
                                    items.keys.elementAt(index).toString()),
                              ],
                            ),
                          )
                        ]),
                        //Text(items.keys.elementAt(index).toString()),
                      );
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
