import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(-29.905850, -71.264190), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Map(cameraPosition: _cameraPosition, controller: _controller),
    );
  }
}
