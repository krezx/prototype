import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prototype1/screens/account_screen.dart';
import 'package:prototype1/screens/settings_screen.dart';
import 'package:prototype1/screens/help_screen.dart';

class Map extends StatelessWidget {
  Map({
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
        title: Text('Nombre App'),
        backgroundColor: Color.fromARGB(100, 239, 66, 124),
      ),
      drawer: Drawer(
        // Agregamos un Drawer para la navegación desplegable
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(100, 239, 66, 124),
              ),
              child: Text('Menú'),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Mapa'),
              onTap: () {
                // Acción cuando se selecciona la opción 1
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person_2),
              title: Text('Cuenta'),
              onTap: () {
                // Acción cuando se selecciona la opción 2
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cuenta()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ajustes'),
              onTap: () {
                // Acción cuando se selecciona la opción 3
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ajustes()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ayuda'),
              onTap: () {
                // Acción cuando se selecciona la opción 4
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ayuda()),
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
            child: Icon(Icons.share),
          ),
          SizedBox(height: 16), // Espacio entre los botones flotantes
          FloatingActionButton(
            heroTag:
                'sosButton', // Asigna una etiqueta única para el botón de SOS
            onPressed: () {},
            child: Icon(Icons.sos),
          ),
          SizedBox(height: 16), // Espacio entre los botones flotantes
          FloatingActionButton(
            heroTag:
                'helpButton', // Asigna una etiqueta única para el botón de ayuda
            onPressed: () {},
            child: Icon(Icons.help),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('REPORTE', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
