import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bollino/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../home_business.dart';
import '../home.dart';
import '../home_business.dart';
import '../metodi_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_image.dart';

class BusinessRegistration2 extends StatefulWidget {
  const BusinessRegistration2({Key? key}) : super(key: key);

  @override
  _BusinessRegistration2State createState() => _BusinessRegistration2State();
}

class _BusinessRegistration2State extends State<BusinessRegistration2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                Upload();
              },
              child: Text('carica logo')),
          FutureBuilder(
              future: getUrlLogo(getUid()),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {if(snapshot.hasData && snapshot.data !=''){
                String? url = snapshot.data;
                return Image.network(url!);}
                return Container();
              }),
          ElevatedButton(
              onPressed: () {
                setState(() {});

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home_Business()),
                );
              },
              child: Text('Conferma registrazione'))
        ],
      ),
    );
  }
}
