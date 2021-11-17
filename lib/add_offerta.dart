import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'metodi_database.dart';
import 'package:location/location.dart' as loc;
import 'package:geolocator/geolocator.dart';

class AddOfferta extends StatefulWidget {
  const AddOfferta({Key? key}) : super(key: key);

  @override
  _AddOffertaState createState() => _AddOffertaState();
}

class _AddOffertaState extends State<AddOfferta> {
  String nomeOfferta = '';
  String descrizioneOfferta = '';
  String locationMessagge = '';
  var location = loc.Location();

  Map<String, double> userLocation = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              //controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome offerta',
              ),
              onChanged: (text) {
                setState(() {
                  nomeOfferta = text;
                  print(text);
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              //controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrizione Offerta',
              ),
              onChanged: (text) {
                setState(() {
                  descrizioneOfferta = text;
                  print(text);
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addOfferta(nomeOfferta, descrizioneOfferta);
                Navigator.pop(context);
              },
              child: Text('carica offerta')),
          ElevatedButton(
              onPressed: () {
                getCurrentLocation();
                getLocationFromAddress();
              },
              child: Text('indirizzo in geolog'))
        ],
      ),
    );
  }

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessagge = "$position.latitude, $position.longitude";
    });
  }

  Future<List<Location>> getLocationFromAddress() async {
    List<Location> locations =
        await locationFromAddress("viale legioni romane 65, Milano");
    print('indirizzo locale = '+locations.toString());
    return locations;
  }
}
