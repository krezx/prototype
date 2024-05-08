import 'package:flutter/material.dart';
import 'package:test02/screens/account_screen.dart';
import 'package:test02/screens/settings_screen.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ayuda'),
          backgroundColor: Color.fromARGB(100, 239, 66, 124),
        ),
        body: const Center(
          child: Text('Información de Ayuda'),
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
      ),
    );
  }
}
