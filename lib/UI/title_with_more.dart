import 'package:flutter/material.dart';

class TitleWithMore extends StatelessWidget {
  const TitleWithMore({
    Key? key, required this.text, required this.pres,
  }) : super(key: key);
  final String text;
  final void Function()? pres;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          TitleLeTueTessere(
            text: text,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: pres,
            child: Text(
              'Altro',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(70, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36)),
                padding:
                EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                primary: Colors.deepPurpleAccent.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}

class TitleLeTueTessere extends StatelessWidget {
  const TitleLeTueTessere({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 2),
              height: 4,
              color: Colors.deepPurpleAccent.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
