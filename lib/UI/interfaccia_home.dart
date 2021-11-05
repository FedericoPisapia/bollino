import 'package:flutter/material.dart';
import 'package:bollino/UI/body.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.view_headline_rounded),
        onPressed: () {},
      ),
    );
  }
}
