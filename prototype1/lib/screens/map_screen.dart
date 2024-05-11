import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/nav.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;
  late Position currentPosition;

  @override
  void initState() {
    super.initState();
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void _onMapCreated(GoogleMapController controller) async {
    currentPosition = await _determinePosition();
    mapController = controller;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 15.0,
      ),
    ));
  }

  void _getCurrentLocation() async {
    currentPosition = await _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre App'),
        backgroundColor: const Color.fromARGB(100, 239, 66, 124),
      ),
      drawer: const MainDrawer(),
      body: GoogleMap(
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-29.9053048, -71.2634563),
          zoom: 15.0,
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
            onPressed: () {
              // Mostrar la ventana flotante cuando se presione el botón
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('LLAMADA DE EMERGENCIA'),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.local_police, size: 40),
                                // Aumenta el tamaño del icono
                              ),
                              const SizedBox(
                                  height:
                                      2), // Espacio entre el icono y el texto
                              const Text('133', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.person,
                                    size: 40), // Aumenta el tamaño del icono
                              ),
                              const SizedBox(
                                  height:
                                      2), // Espacio entre el icono y el texto
                              const Text('Contacto',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Cerrar la ventana flotante cuando se presione el botón "Cerrar"
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
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
                onPressed: () {
                  // Mostrar la ventana flotante cuando se presione el botón
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'REPORTE',
                          textAlign: TextAlign.center,
                        ),
                        // content: Text('Esta es una ventana flotante.'),
                        actions: <Widget>[
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.report,
                                    size: 40), // Aumenta el tamaño del icono
                              ),
                              const SizedBox(
                                  height:
                                      8), // Espacio entre el icono y el texto
                              const Text('Reporte 1',
                                  style: TextStyle(fontSize: 20)),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.report,
                                    size: 40), // Aumenta el tamaño del icono
                              ),
                              const SizedBox(
                                  height:
                                      8), // Espacio entre el icono y el texto
                              const Text('Reporte 2',
                                  style: TextStyle(fontSize: 20)),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.report,
                                    size: 40), // Aumenta el tamaño del icono
                              ),
                              const SizedBox(
                                  height:
                                      8), // Espacio entre el icono y el texto
                              const Text('Reporte 3',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Cerrar la ventana flotante cuando se presione el botón "Cerrar"
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('REPORTE', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
