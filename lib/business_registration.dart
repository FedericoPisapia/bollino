import 'package:flutter/material.dart';
import 'package:bollino/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../home_business.dart';
import '../home.dart';
import '../home_business.dart';
import '../business_registration2.dart';
import '../metodi_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_image.dart';

class BusinessRegistration extends StatefulWidget {
  const BusinessRegistration({Key? key}) : super(key: key);

  @override
  _BusinessRegistrationState createState() => _BusinessRegistrationState();
}

class _BusinessRegistrationState extends State<BusinessRegistration> {
  CollectionReference business =
      FirebaseFirestore.instance.collection('business');

  bool Val = false;
  String partitaIva = '';
  String numeroDiTelefono = '';
  String indirizzo = '';
  String orarioApertura = '';
  String orarioChiusura = '';
  String nome = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(height: 40),
      Container(
        child: Image.asset('images/logo.png'),
        height: 150,
        width: 150,
      ),
              SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  //controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome Business',
                  ),
                  onChanged: (text) {
                    setState(() {
                      nome = text;
                      print(text);
                    });
                  },
                ),
              ),
      SizedBox(height: 50),
      Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          //controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Partita Iva',
          ),
          onChanged: (text) {
            setState(() {
              partitaIva = text;
              print(text);
            });
          },
        ),
      ),
      if ( Val)
        Container(
          child: Text('inserimento errato'),
        ),
      Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          //controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Numero di telefono',
          ),
          onChanged: (text) {
            setState(() {
              numeroDiTelefono = text;
              print(text);
            });
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          //controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Indirizzo',
          ),
          onChanged: (text) {
            setState(() {
              indirizzo = text;
              print(text);
            });
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          //controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Orario apertura',
          ),
          onChanged: (text) {
            setState(() {
              orarioApertura = text;
              print(text);
            });
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          //controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Orario chiusura',
          ),
          onChanged: (text) {
            setState(() {
              orarioChiusura = text;
              print(text);
            });
          },
        ),
      ),

      ElevatedButton(
          onPressed: () {
            setState(() {
              Val = true;
            });
            addBusiness(business,nome, partitaIva, numeroDiTelefono, indirizzo,
                orarioApertura, orarioChiusura);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BusinessRegistration2()),
            );
          },
          child: Text('Conferma registrazione'))
    ])));
  }
}
