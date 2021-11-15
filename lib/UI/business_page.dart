import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../metodi_database.dart';

class BusinessPage extends StatelessWidget {
  BusinessPage({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.view_headline_rounded),
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              // 20% dello screen
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      bottom: 50,
                    ),
                    height: size.height * 0.20,
                    //grandezza bordo viola
                    decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36)))),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),


                  ),
                ],
              ),
            ),
            FutureBuilder(
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
                    String Numeroditelefono =
                    snapshot.data!['Numero di telefono'];
                    String Orariodiapertura =
                    snapshot.data!['Orario di apertura'];
                    String Orariodichiusura =
                    snapshot.data!['Orario di chiusura'];

                    return Column(
                      children: [
                        Text('Indirizzo : ' + Indirizzo, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),),

                        Text('Numero di telefono : ' + Numeroditelefono, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),),

                        Text('Orario di apertura : '+ Orariodiapertura, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),),

                        Text('Orario di chiusura : ' + Orariodichiusura, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),),

                      ],
                    );
                  }
                  return Container();
                }),
          ],
        ));
  }
}
