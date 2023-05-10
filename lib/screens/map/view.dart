import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {

  final completer = Completer<GoogleMapController>();
  static const CameraPosition cairo = CameraPosition(
    target: LatLng(30.0596113, 31.3408666),
    zoom: 8,
  );
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers,
        onTap: (argument) {
          markers.add(Marker(
              markerId: MarkerId("name"),
              position: LatLng(argument.latitude.toDouble(),
                  argument.longitude.toDouble())));
          setState(() {});
        },
        mapType: MapType.normal,
        initialCameraPosition: cairo,
        onMapCreated: (GoogleMapController controller) {
          completer.complete(controller);
        },
      ),
    );
  }

}