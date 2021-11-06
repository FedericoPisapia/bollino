import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../UI/header_with_searchbox.dart';
import '../UI/title_with_more.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size; prende dimensione di tutto lo screen
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMore(
            text: 'Le tue foto piedi',
            pres: () {},
          ),
          //40% dello screen
          Container(width: size.width *0.4,)
        ],
      ),
    );
  }
}
