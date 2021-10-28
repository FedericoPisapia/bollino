import 'package:bollino/metodi_database.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../metodi_database.dart';

class QrCliente extends StatelessWidget {
   QrCliente({Key? key}) : super(key: key);
final CollectionReference users = FirebaseFirestore.instance.collection('users');
String User = 'FwmX5G89ymRwEBYfn6pc3UdMxPO2';
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('prova'),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  addpoint(User, getUid());

                  //Navigator.of(context).push(MaterialPageRoute(
                    //builder: (context) => QRScan(),
                  //));
                },
                child: Text('scan'))));

  }
  Future<void> addpoint(utente, produttore) {
    // Call the user's CollectionReference to add a new user
    print('uid utente= ' +  utente);
    print('uid produttore= ' + produttore);
    return  users
        .doc(utente)
        .update({produttore: FieldValue.increment(1)})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}

class QRScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

}


