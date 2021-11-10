import 'package:flutter/material.dart';

import 'metodi_database.dart';

class AddOfferta extends StatefulWidget {
  const AddOfferta({Key? key}) : super(key: key);

  @override
  _AddOffertaState createState() => _AddOffertaState();
}

class _AddOffertaState extends State<AddOfferta> {
  String nomeOfferta = '';
  String descrizioneOfferta = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              //controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome offerta',
              ),
              onChanged: (text) {
                setState(() {
                  nomeOfferta = text;
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
                labelText: 'Descrizione Offerta',
              ),
              onChanged: (text) {
                setState(() {
                  descrizioneOfferta = text;
                  print(text);
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addOfferta(nomeOfferta, descrizioneOfferta);
                Navigator.pop(context);
              },
              child: Text('carica offerta'))
        ],
      ),
    );
  }
}
