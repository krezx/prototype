import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-29.9053048, -71.2634563);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre App'),
        backgroundColor: const Color.fromARGB(100, 239, 66, 124),
      ),
      drawer: MainDrawer(),
      body: GoogleMap(
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag:
                'shareButton', // Asigna una etiqueta única para el botón de compartir
            onPressed: () {},
            child: const Icon(Icons.share),
          ),
          const SizedBox(height: 16), // Espacio entre los botones flotantes
          FloatingActionButton(
            heroTag:
                'sosButton', // Asigna una etiqueta única para el botón de SOS
            onPressed: () {},
            child: const Icon(Icons.sos),
          ),
          const SizedBox(height: 16), // Espacio entre los botones flotantes
          FloatingActionButton(
            heroTag:
                'helpButton', // Asigna una etiqueta única para el botón de ayuda
            onPressed: () {},
            child: const Icon(Icons.help),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('REPORTE', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
