import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../metodi_database.dart';

class BusinessPage extends StatelessWidget {
  BusinessPage({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getBusiness(uid),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (snapshot.hasData) {
                String Indirizzo = snapshot.data!['Indirizzo'];
                String Numeroditelefono = snapshot.data!['Numero di telefono'];
                String Orariodiapertura = snapshot.data!['Orario di apertura'];
                String Orariodichiusura = snapshot.data!['Orario di chiusura'];

                return Column(
                  children: [
                    Text(Indirizzo),
                    Text(Numeroditelefono),
                    Text(Orariodiapertura),
                    Text(Orariodichiusura),
                  ],
                );
              }
              return Container();
            }));
  }
}
