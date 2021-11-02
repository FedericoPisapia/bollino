import 'package:flutter/material.dart';
import '../registration_produttore.dart';
import '../registration.dart';
import '../login_cliente.dart';
import '../login_produttore.dart';
import '../home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  // if (firebaseUser != null) {
  //   firstWidget = Home();
  // } else {
  //   firstWidget = Autenticazione();
  // }

  runApp(const MaterialApp(
    title: 'Bollino',
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      return Home();
    } else {
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => Autenticazione()));
      return Login();
    }
    return Container();
  }
}
