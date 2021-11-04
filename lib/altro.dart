import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bollino/business_registration.dart';
import 'package:bollino/metodi_database.dart';
import '../home_business.dart';
import '../home.dart';

class Altro extends StatefulWidget {
  bool home;
  Altro({Key? key, required this.home}) : super(key: key);

  @override
  State<Altro> createState() => _AltroState();
}

class _AltroState extends State<Altro> {
  bool ver = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        FutureBuilder(
            future: verifyBusiness(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                ver = snapshot.data!;
                if (ver == false || ver == null) {
                  return FlatButton(
                    textColor: Colors.white,
                    height: 60.0,
                    color: Colors.cyan,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusinessRegistration()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add_business_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Registra il tuo locale',
                        ),
                      ],
                    ),
                  );
                } else {
                  return FlatButton(
                    textColor: Colors.white,
                    height: 60.0,
                    color: Colors.cyan,
                    onPressed: () {if(widget.home) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home_Business()),
                      );
                    }else Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()),
                    );},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add_business_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'cambia interfaccia',
                        ),
                      ],
                    ),
                  );
                }
              } else {
                /// Display a loader untill data is not fetched from server
                return Container();
              }
            }),
        FlatButton(
          textColor: Colors.white,
          height: 60.0,
          color: Colors.cyan,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.assignment_ind_sharp,
                  color: Colors.white,
                ),
              ),
              Text(
                'il mio account',
              ),
            ],
          ),
        ),
        FlatButton(
          textColor: Colors.white,
          height: 60.0,
          color: Colors.cyan,
          onPressed: () async {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.red,
                ),
              ),
              Text(
                'foto',
              ),
            ],
          ),
        ),
        FlatButton(
          textColor: Colors.white,
          height: 60.0,
          color: Colors.cyan,
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.red,
                ),
              ),
              Text(
                'log out',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
