import 'package:flutter/material.dart';
import 'package:bollino/businessRegistration.dart';
class RegistraIlTuoLocale extends StatelessWidget {
  const RegistraIlTuoLocale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        FlatButton(
          textColor: Colors.white,
          height: 60.0,
          color: Colors.cyan,
          onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  BusinessRegistration()),
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
                'Registra il tuo locale',
              ),

            ],
          ),
        ),
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
                  Icons.add_business_outlined,
                  color: Colors.white,
                ),
              ),
              Text(
                'cambia interfaccia locale',
              ),

            ],
          ),
        ),
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
          onPressed: () {},
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
