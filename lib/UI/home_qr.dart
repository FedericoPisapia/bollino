import 'package:flutter/material.dart';
import 'package:bollino/business_registration.dart';
import 'package:flutter/material.dart';
import '../home_business.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_database.dart';
import '../altro.dart';
import '../UI/interfaccia_home_utente.dart';
import '../home_stream.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeQr extends StatefulWidget {
  const HomeQr({Key? key}) : super(key: key);

  @override
  _HomeQrState createState() => _HomeQrState();
}

class _HomeQrState extends State<HomeQr> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.view_headline_rounded),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              // 20% dello screen
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      bottom: 50,
                    ),
                    height: size.height * 0.21 - 27, //grandezza bordo viola
                    decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                child: QrImage(
                  data: getUid(),
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
