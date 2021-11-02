import 'package:bollino/registration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../lettore_qr_cliente.dart';
import '../home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Password = '';
  String Email = '';
  bool emailVal = true;
  bool passval = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 40),

              Container(child: Image.asset('images/logo.png'),),

              SizedBox(height: 50),

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
                              builder: (context) =>  Home()),
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
              ),
              TextButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  Registration()),
              );}, child: Text('vuoi registrarti?'))
            ])));
  }
}
