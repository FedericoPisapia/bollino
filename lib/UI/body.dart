import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../UI/header_with_searchbox.dart';
import '../UI/title_with_more.dart';
import '../metodi_database.dart';
import 'business_page.dart';

class Body extends StatefulWidget {
  Body(this.items, {Key? key}) : super(key: key);
  Map<String, dynamic> items;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String uri = '';
  String nomeLocale = '';
  String search = '';
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size; prende dimensione di tutto lo screen
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
      Container(
      margin: EdgeInsets.only(bottom: 10),
      // 20% dello screen
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10,
              bottom: 50,
            ),
            height: size.height * 0.21 - 27, //grandezza bordo viola
            decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: <Widget>[
                Text(
                  'Ciao NomeUtente!',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset(
                  'images/logo.png',
                  height: 150,
                  width: 150,
                )
              ],
            ),
          ),
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
                      final filteredMap = new Map.fromIterable(
                          widget.items.keys.where((k) => k.startsWith(search)), key: (k) => k, value: (k) => widget.items[k]);
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
    ),
          TitleWithMore(
            text: 'Le tue tessere',
            pres: () {},
          ),
          //40% dello screen
          tessere(),
          TitleWithMore(
            text: 'Le offerte disponibili',
            pres: () {},

          ),
        ],
      ),
    );
  }

  SizedBox tessere() {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) => Card(
          elevation: 10,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              SizedBox(height: 2),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusinessPage(
                                uid: widget.items.keys
                                    .elementAt(index)
                                    .toString())),
                      );
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'images/corta.jpg',
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder<List<String>>(
                  future: getUrlLogoEName(
                      widget.items.keys.elementAt(index).toString().trim()),
                  builder:
                      (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasError) {
                      print('erore');
                    }
                    if (snapshot.hasData) {
                      uri = snapshot.data![0].toString();
                      var nomeLocale=snapshot.data![1].toString();
                      if (uri != '') {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: [
                                Text(nomeLocale),
                              ],
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.network(uri),
                            ),
                          ],
                        );
                      }
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget TesserePunti(Size size, items) {
    return Container(
      child: SizedBox(
        height: size.height * 0.2,
        width: size.width * 0.2,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('22'),
            );
          },
        ),
      ),
    );
  }
}

class TesseraPunti extends StatefulWidget {
  TesseraPunti(
      {Key? key,
      required this.size,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final Size size;
  String image;

  String title;
  String subtitle;

  @override
  State<TesseraPunti> createState() => _TesseraPuntiState();
}

class _TesseraPuntiState extends State<TesseraPunti> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('suca');
      },
      child: Container(
        width: widget.size.width * 0.4,
        margin: EdgeInsets.only(left: 10, top: 5, bottom: 25),
        child: Column(
          children: <Widget>[
            Image.asset(
              widget.image,
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
                          text: widget.title, style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                  Spacer(),
                  Text(widget.subtitle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
