import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/screens/account_screen.dart';
import 'package:prototype1/screens/settings_screen.dart';
import 'package:prototype1/screens/help_screen.dart';

class Map extends StatelessWidget {
  const Map({
    super.key,
    required CameraPosition cameraPosition,
    required Completer<GoogleMapController> controller,
  })  : _cameraPosition = cameraPosition,
        _controller = controller;

  final CameraPosition _cameraPosition;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre App'),
        backgroundColor: const Color.fromARGB(100, 239, 66, 124),
      ),
      drawer: Drawer(
        // Agregamos un Drawer para la navegación desplegable
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(100, 239, 66, 124),
              ),
              child: Text('Menú'),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Mapa'),
              onTap: () {
                // Acción cuando se selecciona la opción 1
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text('Cuenta'),
              onTap: () {
                // Acción cuando se selecciona la opción 2
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cuenta()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ajustes'),
              onTap: () {
                // Acción cuando se selecciona la opción 3
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ajustes()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ayuda'),
              onTap: () {
                // Acción cuando se selecciona la opción 4
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ayuda()),
                );
              },
            ),
            // Puedes agregar más ListTile para más opciones
          ],
        ),
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
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
