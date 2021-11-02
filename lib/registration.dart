import 'package:flutter/material.dart';
import '../home_business.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../metodi_database.dart';
import '../home.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String UserName = '';
  String Password = '';
  String Email = '';
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrazione"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                //controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
                onChanged: (text) {
                  setState(() {
                    UserName = text;
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
            Container(
              child: ElevatedButton(
                  onPressed: () async {
                    if (Validation(Email, Password, UserName)) {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: Email, password: Password);
                      addUser(users, Email);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Home()),
                      );
                    } else {
                      setState(() {
                        val = false;
                        print('compilazione non corretta');
                      });
                    }
                  },
                  child: const Text('salva')),
            ),
            if (!val)
              Container(
                child: Text('non corretta'),
              )
          ],
        ),
      ),
    );
  }
}

bool Validation(String email, String pass, String username) {
  bool usernamevalid = false;
  bool passValid = false;
  bool corretto = true;
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  print('emailValid');
  print(emailValid);

  if (pass.length > 6) {
    passValid = true;
  }

  if (username.length > 6) {
    usernamevalid = true;
  }
  print('usernamevalid');
  print(usernamevalid);
  print('passValid');
  print(passValid);
  if (emailValid && passValid && usernamevalid) {
    print(corretto);
    return corretto;
  }

  return corretto = false;
}


