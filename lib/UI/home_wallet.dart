import 'package:bollino/UI/components.dart';
import 'package:flutter/material.dart';

class HomeWallet extends StatefulWidget {
  const HomeWallet({Key? key}) : super(key: key);

  @override
  _HomeWalletState createState() => _HomeWalletState();
}

class _HomeWalletState extends State<HomeWallet> {
  String searchWallet = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        drawer: DrawerHome(),
        body: Container(
          margin: EdgeInsets.only(bottom: 10),
          // 20% dello screen
          height: size.height * 0.2,
          child: Stack(children: <Widget>[
            header_home(context, size, 'Le tue tessere!'),
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
                        searchWallet = text;
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
          ]),
        ));
  }
}
