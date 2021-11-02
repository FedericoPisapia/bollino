import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home_business.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginCliente extends StatefulWidget {
  const LoginCliente({Key? key}) : super(key: key);

  @override
  _LoginClienteState createState() => _LoginClienteState();
}

class _LoginClienteState extends State<LoginCliente> {
  String Password = '';
  String Email = '';
  bool emailVal = true;
  bool passval = true;


  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text('login cliente'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  //controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onChanged: (text) {
                    setState(() {
                      Email = text;
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
                    labelText: 'Password',
                  ),
                  onChanged: (text) {
                    setState(() {
                      Password = text;
                      print(text);
                    });
                  },
                ),
              ),
              if (!emailVal)
                Container(
                  child: Text('mail errata'),
                ),
              if (!passval)
                Container(
                  child: Text('pass errata'),
                ),
              Container(
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: Email, password: Password);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Home_Business()),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          setState(() {
                            emailVal = false;
                          });

                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          setState(() {
                            emailVal = false;
                            passval = false;
                          });
                        }
                      }
                    },
                    child: Text('Login')),
              )
        ])));
  }
}
