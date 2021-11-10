import 'package:bollino/UI/title_with_more.dart';
import 'package:flutter/material.dart';

import 'add_offerta.dart';
import 'edita_tesssera.dart';

class PaginaInizialeBusiness extends StatefulWidget {
  const PaginaInizialeBusiness({Key? key}) : super(key: key);

  @override
  _PaginaInizialeBusinessState createState() => _PaginaInizialeBusinessState();
}

class _PaginaInizialeBusinessState extends State<PaginaInizialeBusiness> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(50),
          child: Image.asset('images/logo.png'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddOfferta(),
                  ));
            },
            child: Text('Aggiungi la tua offerta')),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditaTessera(),
                  ));
            },
            child: Text('edita tessera'))
      ],
    );
  }
}
