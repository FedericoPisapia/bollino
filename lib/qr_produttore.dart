import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

//https://pub.dev/packages/qr_flutter

class QrProduttore extends StatelessWidget {
  const QrProduttore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prova'),
      ),
      body: QrImage(
        data: "www.facebook.it",
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
