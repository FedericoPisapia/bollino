import 'package:flutter/material.dart';
import '../registration_produttore.dart';
import '../registration_cliente.dart';
import '../login_cliente.dart';
import '../login_produttore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Autenticazione extends StatelessWidget {
  const Autenticazione({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('inizio'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationProduttore()),
                  );
                },
                child: const Text('registrazione produttore')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationCliente()),
                  );
                },
                child: const Text('registrazione cliente')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginProduttore()),
                  );
                },
                child: const Text('login produttore')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginCliente()),
                  );
                },
                child: const Text('login cliente'))
          ],
        ));
  }}