import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/nav.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      _getCurrentLocation();
    } else {
      // Handle denied or restricted permission
      // Puedes mostrar un diálogo o un mensaje al usuario aquí
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 15.0,
      ),
    ));
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
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
        initialCameraPosition: const CameraPosition(
          target: LatLng(-29.9053048, -71.2634563),
          zoom: 15.0,
        ),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
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
