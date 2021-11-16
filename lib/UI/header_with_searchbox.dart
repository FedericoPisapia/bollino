import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class HeaderWithSearchBox extends StatefulWidget {
   HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<HeaderWithSearchBox> createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // 20% dello screen
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          header_home(context, widget.size, 'hello'),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.deepPurpleAccent.withOpacity(0.4),
                      )
                    ]),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      search = text;
                      print(text);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: Colors.deepPurpleAccent.withOpacity(0.4)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search)),
                ),
              ))
        ],
      ),
    );
  }


}
