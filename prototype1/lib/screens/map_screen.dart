import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/nav.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sensors/sensors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ActionWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionWidget({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

bool _ventanaSosAbierta = false;
int count = 0;

_callNumber() async {
  const number = '9 30023656';
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

dynamic ventanaSos(BuildContext context) {
  AudioPlayer audioPlayer = AudioPlayer();
  if (!_ventanaSosAbierta) {
    audioPlayer.play(AssetSource('audio/sos-43210.mp3'));
    count = 0;
    _ventanaSosAbierta = true;
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
                        height: 2), // Espacio entre el icono y el texto
                    const Text('133', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _callNumber();
                      },
                      icon: const Icon(Icons.person,
                          size: 40), // Aumenta el tamaño del icono
                    ),
                    const SizedBox(
                        height: 2), // Espacio entre el icono y el texto
                    const Text('Contacto', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                // Cerrar la ventana flotante cuando se presione el botón "Cerrar"
                _ventanaSosAbierta = false;
                audioPlayer.stop();
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;
  late Position currentPosition;

  @override
  void initState() {
    super.initState();
    // Configura el listener para detectar la sacudida
    int temp = 0;
    accelerometerEvents.listen((AccelerometerEvent event) {
      temp++;
      if (!_ventanaSosAbierta &&
          (event.x.abs() > 30 || event.y.abs() > 30 || event.z.abs() > 30)) {
        print(count);
        count++;
      }
      if (temp == 200) {
        count = 0;
        temp = 0;
      }
      if (count == 30) ventanaSos(context);
    });
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
        title: const Text('Camina Conmigo'),
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
              ventanaSos(context);
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
                        content: const SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Agresión\n Verbal'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Agresión\n Física'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Poca\n Iluminación'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Espacios\n Abandonados'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Puntos\n Ciegos'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Falta de\n baños\n públicos'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Mobiliario\n Inadecuado'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Veredas\n en mal\n estado'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label:
                                              'Personas\n en\n situación\n de calle'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label: 'Reunión\n de\n hombres'),
                                      ActionWidget(
                                          icon: Icons.report,
                                          label:
                                              'Presencia\n de bares\n y\n restobar'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cerrar'),
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
