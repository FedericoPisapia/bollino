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
              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('business').
                  withConverter<Map<String, dynamic>>(
                    fromFirestore: (snapshot, _) => snapshot.data() ?? Map<String, dynamic>(),
                    toFirestore: (model, _) => Map<String, dynamic>.from(model as Map),
                  )
                      .snapshots(),
                  builder:
                      (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    /*if (snapshot.hasData &&
                        snapshot.data!['Offerta'].toString() == '') {
                      return Container();
                    }*/
                    if (snapshot.hasData) {

                      var offerta = snapshot.data!;
                      print('offerta ---------');
                      print(offerta.docs.elementAt(1)['Offerta'].keys);

                      snapshot.data!.docs.forEach((element) {print(element['Uid']);});
                      //print(snapshot.data!['offerta'].toString());
                      return Body(items,offerta);
                    }
                    return Container();
                  });
                //Body(items);
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
