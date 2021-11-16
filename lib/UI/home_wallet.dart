import 'package:bollino/UI/components.dart';
import 'package:bollino/UI/title_with_more.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../metodi_database.dart';
import 'business_page.dart';

class HomeWallet extends StatefulWidget {
  const HomeWallet({Key? key}) : super(key: key);

  @override
  _HomeWalletState createState() => _HomeWalletState();
}

class _HomeWalletState extends State<HomeWallet> {
  String search = '';
  String uri = '';
  String nomeLocale = '';
  Map filteredMapItems= new Map() ;

  final Stream<DocumentSnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').doc(getUid()).snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        drawer: DrawerHome(),
        body: SingleChildScrollView(
          child: Column(
            children: [

              StreamBuilder<DocumentSnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {

                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    if (snapshot.hasData &&
                        snapshot.data!['Business'].toString() == '') {
                      return Container();
                    }
                    if (snapshot.hasData) {
                      Map<String, dynamic> items = snapshot.data!['Business'];
                      print(items);
                      filteredMapItems =  { for (var k in items.keys.where(
                              (k) => k.startsWith(search))) k : items[k] };
                      //filteredMapItems = items; //DA CONTROLLARE
                      return SingleChildScrollView(
                          child: Column(mainAxisSize: MainAxisSize.min, children: <
                              Widget>[
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
                                    height: size.height * 0.21 - 27,
                                    //grandezza bordo viola
                                    decoration: const BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(36),
                                            bottomRight: Radius.circular(36))),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Ciao NomeUtente!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
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
                                                color: Colors.deepPurpleAccent
                                                    .withOpacity(0.4),
                                              )
                                            ]),
                                        child: TextField(
                                          onChanged: (text) {
                                            setState(() {
                                              search = text;
                                              print(search);

                                              print('AGGIORANTA');
                                              print("AGGIORANTA" + filteredMapItems.toString());
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Search",
                                              hintStyle: TextStyle(
                                                  color: Colors.deepPurpleAccent
                                                      .withOpacity(0.4)),
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
                            SizedBox(
                              height: 150.0,
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: filteredMapItems.length,
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
                                                        uid: filteredMapItems.keys
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
                                              filteredMapItems.keys.elementAt(index).toString().trim()),
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
                            ),
                          ]));
                    }
                    return Container();
                  })
            ],
          ),
        ));
  }

  /*SizedBox tessere(filteredMap, size) {

    print('---------');
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
  }*/
}
