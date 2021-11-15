import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../UI/header_with_searchbox.dart';
import '../UI/title_with_more.dart';
import '../metodi_database.dart';
import 'business_page.dart';

class Body extends StatefulWidget {
  Body(this.items, this.offerta, {Key? key}) : super(key: key);
  Map<String, dynamic> items;
  var offerta;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String uri = '';
  String nomeLocale = '';
  String search = '';
  Map filteredMapItems = new Map();

  var filteredMapOfferta ;

  @override
  void initState() {
    filteredMapItems = widget.items;
    filteredMapOfferta = widget.offerta;
  }

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
                            print(search);
                            filteredMapItems = new Map.fromIterable(
                                widget.items.keys
                                    .where((k) => k.startsWith(search)),
                                key: (k) => k,
                                value: (k) => widget.items[k]);
                            print(filteredMapItems);
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color:
                                    Colors.deepPurpleAccent.withOpacity(0.4)),
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
          tessere(filteredMapItems, size),
          TitleWithMore(
            text: 'Le offerte disponibili',
            pres: () {},
          ),
          tessereOfferte(filteredMapOfferta,size),
        ],
      ),
    );
  }

  SizedBox tessere(filteredMap,size) {
    print(filteredMap.length);
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: filteredMap.length,
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
                                uid: filteredMap.keys
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
                      filteredMap.keys.elementAt(index).toString().trim()),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasError) {
                      print('erore');
                    }
                    if (snapshot.hasData) {
                      uri = snapshot.data![0].toString();
                      var nomeLocale = snapshot.data![1].toString();
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
  SizedBox tessereOfferte(filteredMap,size) {
    print(filteredMap.size);
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: filteredMap.size,
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
                                uid: filteredMap.docs.elementAt(index)['Uid']
                                    .toString())),
                      );
                    },
                    child: Container(
                      child: Text(filteredMap.docs.elementAt(index)['Offerta'].keys.toString())
                    ),
                  ),
                ],
              ),
              FutureBuilder<List<String>>(
                  future: getUrlLogoEName(
                      filteredMap.docs.elementAt(index)['Uid']
                          .toString()),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasError) {
                      print('errore');
                    }
                    if (snapshot.hasData) {
                      uri = snapshot.data![0].toString();
                      var nomeLocale = snapshot.data![1].toString();
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
}
