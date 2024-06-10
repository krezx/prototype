import 'package:flutter/material.dart';
import 'package:prototype1/screens/account_screen.dart';
import 'package:prototype1/screens/settings_screen.dart';
import 'package:prototype1/screens/help_screen.dart';
import 'package:prototype1/screens/map_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Agregamos un Drawer para la navegación desplegable
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("John Doe"),
                  accountEmail: Text("john.doe@example.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: FlutterLogo(size: 42.0),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(100, 239, 66, 124),
                  ),
                ),
              ],
            ),
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
            leading: const Icon(Icons.person),
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
