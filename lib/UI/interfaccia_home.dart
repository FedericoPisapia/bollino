import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bollino/UI/body.dart';

import '../metodi_database.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final Stream<DocumentSnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').doc(getUid()).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: StreamBuilder<DocumentSnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            if (snapshot.hasData &&
                snapshot.data!['Business'].toString() == '') {
              return Container();
            }
            if (snapshot.hasData) {
              Map<String, dynamic> items = snapshot.data!['Business'];
              return Body(items);
            }
            return Container();
          }),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.view_headline_rounded),
        onPressed: () {},
      ),
    );
  }
}
