import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.deepPurpleAccent,
    elevation: 0,
  );
}
Drawer DrawerHome() {
  return Drawer(

    child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      _createHeader(),
      _createDrawerItem(
        icon: Icons.assignment_ind_sharp,
        text: 'Il mio profilo',
      ),
      _createDrawerItem(
        icon: Icons.settings,
        text: 'Impostazioni',
      ),
      _createDrawerItem(icon: Icons.admin_panel_settings, text: 'Privacy'),
      _createDrawerItem(
          icon: Icons.assignment_late_sharp, text: 'Disconnettiti'),
      Divider(),
      _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
    ]),
  );
}


Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,

      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Flutter Step-by-Step",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
        Center(child: Image.asset('images/profile.png', height: 150,))]));
}

Widget _createDrawerItem({ icon, text, onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
Container header_home(BuildContext context, size, text) {
  return Container(
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
          text,
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Image.asset(
          'images/logo.png',
          height: 130,
          width: 130,
        )
      ],
    ),
  );
}