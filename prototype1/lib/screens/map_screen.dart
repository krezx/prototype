import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/nav.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sensors/sensors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:volume_watcher/volume_watcher.dart';

const LatLng _center = LatLng(-29.9053048, -71.2634563);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ActionWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function selectCurrentLocation;

  const ActionWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.selectCurrentLocation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showReportDialog(context, label, selectCurrentLocation);
            },
            icon: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
            overflow: TextOverflow
                .visible, // Permite que el texto haga salto de línea si es necesario
            softWrap:
                true, // Permite que el texto haga salto de línea si es necesario
          ),
        ],
      ),
    );
  }

  void _showReportDialog(
      BuildContext context, String reportType, Function selectCurrentLocation) {
    TextEditingController descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                _ventanaReportes(context, selectCurrentLocation);
              },
            ),
            Flexible(
              // Agregamos Flexible para que el texto se ajuste correctamente
              child: Text(
                'Reporte de $reportType',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Descripción:'),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Ingrese una descripción (opcional)',
                ),
              ),
              const SizedBox(
                  height:
                      20), // Añade un espacio entre la descripción y los botones
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      selectCurrentLocation();
                      Navigator.of(context)
                          .pop(); // Cierra el diálogo de reporte
                    },
                    child: const Text('Seleccionar Ubicación Actual'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      selectCurrentLocation();
                      mapaReporte = true;
                      Navigator.of(context)
                          .pop(); // Cierra el diálogo de reporte
                    },
                    child: const Text('Seleccionar Ubicación en Mapa'),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
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

void _ventanaReportes(BuildContext context, Function selectCurrentLocation) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('REPORTE', textAlign: TextAlign.center),
        content: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Agresión Verbal',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Agresión Física',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Poca Iluminación',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Espacios Abandonados',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Puntos Ciegos',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Falta de baños públicos',
                              selectCurrentLocation: selectCurrentLocation),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Mobiliario Inadecuado',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Veredas en mal estado',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Personas en situación de calle',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Reunión de hombres',
                              selectCurrentLocation: selectCurrentLocation),
                          ActionWidget(
                              icon: Icons.report,
                              label: 'Presencia de  bares y restobar',
                              selectCurrentLocation: selectCurrentLocation),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}

bool _ventanaSosAbierta = false;
int count = 0;

_callNumber() async {
  const number = '9 30023656';
  // ignore: unused_local_variable
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

dynamic ventanaSos(BuildContext context) {
  late double volumenInicial;
  VolumeWatcher.getCurrentVolume.then((double volume) {
    volumenInicial = volume;
  });
  if (!_ventanaSosAbierta) {
    _ventanaSosAbierta = true;
    count = 0;
    AudioPlayer audioPlayer = AudioPlayer();
    // Configurar el contexto de audio para usar siempre el altavoz
    VolumeWatcher.setVolume(1.0);
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.play(AssetSource('audio/sos-43210.mp3'));
    // Mostrar la ventana flotante cuando se presione el botón
    showDialog(
      context: context,
      barrierDismissible: false,
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
                VolumeWatcher.setVolume(volumenInicial);
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

bool mapaReporte = false;

class _MyHomePageState extends State<MyHomePage> {
  //**************************** Mapa ******************************
  late GoogleMapController mapController;
  late Position currentPosition;
  late bool userposition = false;
  bool _hasLocationPermission = false;
  bool mostrarIcono = false;

  LatLng _currentMapPosition = const LatLng(-29.9053048, -71.2634563);

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      setState(() {
        _hasLocationPermission = true;
      });
    } else {
      setState(() {
        _hasLocationPermission = false;
      });
    }
  }

  void _onMapCreatedSinFunciones(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    Position position = await Geolocator.getCurrentPosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15.0,
      ),
    ));
    setState(() {
      mostrarIcono = false; // Establecer mostrarIcono como false
    });
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  void _getCurrentPinLocation() {
    // Muestra las coordenadas de la posición actual del pin (centro del mapa)
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
              "Lat: ${_currentMapPosition.latitude}, Lng: ${_currentMapPosition.longitude}"),
        );
      },
    );
  }

  void _selectCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentMapPosition = LatLng(position.latitude, position.longitude);
      mostrarIcono = true; // Establecer mostrarIcono como true
    });
    mapController.animateCamera(CameraUpdate.newLatLng(_currentMapPosition));
  }

  // Método para obtener el volumen inicial
  Future<double> getInitialVolume() async {
    return VolumeWatcher.getCurrentVolume;
  }

  //    Shake
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    // Configura el listener para detectar la sacudida
    int temp = 0;
    accelerometerEvents.listen((AccelerometerEvent event) {
      // if (userposition) {
      //   _updateLocation();
      // }
      temp++;
      if (!_ventanaSosAbierta &&
          (event.x.abs() > 30 || event.y.abs() > 30 || event.z.abs() > 30)) {
        count++;
      }
      if (temp == 200) {
        count = 0;
        temp = 0;
      }
      if (count == 30) ventanaSos(context);
    });
  }

  //        Whatsapp
  void shareLocationOnWhatsApp() async {
    Position position = await Geolocator.getCurrentPosition();
    // Número de teléfono al que se enviará el mensaje (incluido el prefijo internacional)
    // se tiene que modificar segun los datos que tengamos del usuario
    String phoneNumber = '+56930023656';

    double latitud = position.latitude;
    double longitude = position.longitude;

    // Mensaje solicitando la ubicación actual
    String message = """Necesito ayuda esta es mi ultima ubicacion:
        https://www.google.cl/maps/search/$latitud,$longitude/?entry=tts""";

    // Construir la URL de WhatsApp con el número de teléfono y el mensaje
    String whatsappUrl =
        'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    // Verificar si la URL se puede abrir
    // ignore: deprecated_member_use
    await launch(whatsappUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camina Conmigo'),
        backgroundColor: const Color.fromARGB(100, 239, 66, 124),
      ),
      drawer: const MainDrawer(),
      body: _hasLocationPermission
          ? Stack(
              children: <Widget>[
                GoogleMap(
                  zoomControlsEnabled: false,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: _center,
                    zoom: 15.0,
                  ),
                  onCameraMove: _onCameraMove,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
                Center(
                  child: Visibility(
                    visible: mostrarIcono,
                    child: const Icon(Icons.location_pin,
                        color: Colors.red, size: 40),
                  ),
                ),
              ],
            )
          : GoogleMap(
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreatedSinFunciones,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
      floatingActionButton: _hasLocationPermission && !mapaReporte
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // FloatingActionButton(
                //   onPressed: _getCurrentPinLocation,
                //   tooltip: 'Get Location',
                //   child: const Icon(Icons.location_pin),
                // ),
                // const SizedBox(height: 16),
                FloatingActionButton(
                  heroTag:
                      'shareButton', // Asigna una etiqueta única para el botón de compartir
                  onPressed: () {
                    shareLocationOnWhatsApp();
                  },
                  child: const Icon(Icons.share),
                ),
                const SizedBox(
                    height: 16), // Espacio entre los botones flotantes
                FloatingActionButton(
                  heroTag:
                      'sosButton', // Asigna una etiqueta única para el botón de SOS
                  onPressed: () {
                    ventanaSos(context);
                  },
                  child: const Icon(Icons.sos),
                ),
                const SizedBox(
                    height: 16), // Espacio entre los botones flotantes
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
                        _ventanaReportes(context, _selectCurrentLocation);
                      },
                      child:
                          const Text('REPORTE', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ],
            )
          : mapaReporte
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mostrarIcono =
                              false; // Establecer mostrarIcono como false
                          mapaReporte = false; // Cambia mapaReporte a false
                        });
                      },
                      child: const Text('CANCELAR',
                          style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(width: 10), // Agrega un espacio entre lo
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mostrarIcono =
                              false; // Establecer mostrarIcono como false
                          mapaReporte = false; // Cambia mapaReporte a false
                        });
                      },
                      child:
                          const Text('ENVIAR', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mapaReporte = true; // Cambia mapaReporte a true
                        });
                        _ventanaReportes(context, _selectCurrentLocation);
                      },
                      child:
                          const Text('REPORTE', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
    );
  }
}
