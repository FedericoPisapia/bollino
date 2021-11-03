import 'package:flutter/material.dart';
import '../metodi_database.dart';

class QR_Verificato extends StatefulWidget {
  var result;

  QR_Verificato({Key? key, required this.result}) : super(key: key);

  @override
  _QR_VerificatoState createState() => _QR_VerificatoState();
}

class _QR_VerificatoState extends State<QR_Verificato> {
  //widget.result!.code
  bool ver = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: verifyUsers(widget.result!.code),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            ver = snapshot.data!;
            if (ver == false || ver == null) {
              return Scaffold(
                body: Column(
                  children: [
                    Image.asset('images/X.png'),
                    SizedBox(height: 30,),
                    Text('QrCode non riconosciuto'),
                    SizedBox(height: 30,),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Indietro'))
                  ],
                ),
              );
            } else {

              return Scaffold(
                body: Column(
                  children: [
                    Image.asset('images/spunta.png'),
                    FutureBuilder(
                      future: getUserEmail(widget.result!.code),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          String email = snapshot.data!;
                          return Text('aggiungere punti a ' + email + ' ?');
                        } else
                          return Text('');
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              addpoint(widget.result!.code, getUid());
                              Navigator.pop(context);
                            },
                            child: Text('Conferma')),
                        ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text('Annulla'))
                      ],
                    )
                  ],
                ),
              );
            }
          } else
            return Container(child: Text('caricamento'),);
        });
  }
}
