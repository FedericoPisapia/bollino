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
          Container(
            width: size.width * 0.4,
            margin: EdgeInsets.only(left: 10, top: 5, bottom: 25),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/tessera.jpg',
                ),
                Container(
                  padding: EdgeInsets.all(10 / 2),
                  decoration: BoxDecoration(color: Colors.white30, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.deepPurpleAccent.withOpacity(0.5))
                  ]),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Piedi",
                              style: TextStyle(color: Colors.black)),
                        ]),
                      ),
                      Spacer(),
                      Text('piedi')
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
