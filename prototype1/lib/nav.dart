import 'package:flutter/material.dart';
import 'package:prototype1/screens/account_screen.dart';
import 'package:prototype1/screens/settings_screen.dart';
import 'package:prototype1/screens/help_screen.dart';
import 'package:prototype1/screens/map_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Material App'),
                ),
              );
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
    );
  }
}
