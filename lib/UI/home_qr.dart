import 'package:flutter/material.dart';
import '../metodi_database.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'components.dart';

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
      appBar: buildAppBar(),
      drawer: DrawerHome(),
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
                  header_home(context, size, 'IL tuo QR-Code!'),
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
