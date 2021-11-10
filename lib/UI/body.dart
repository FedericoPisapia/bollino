import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../UI/header_with_searchbox.dart';
import '../UI/title_with_more.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',),
                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',),
                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',),

                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',)
              ],
            ),
          ),
          TitleWithMore(text: "Offerte", pres: (){}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',),
                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',),
                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',),

                TesseraPunti(size: size, image: 'images/tessera.jpg', subtitle: '10',title: 'strega varana',)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TesseraPunti extends StatelessWidget {
   TesseraPunti({
    Key? key,
    required this.size, required this.image, required this.title, required this.subtitle
  }) : super(key: key);

  final Size size;
  String image ;
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){print('suca');},
      child: Container(
        width: size.width * 0.4,
        margin: EdgeInsets.only(left: 10, top: 5, bottom: 25),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
            ),
            Container(
              padding: EdgeInsets.all(10 / 2),
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
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
                          text: title,
                          style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                  Spacer(),
                  Text(subtitle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
