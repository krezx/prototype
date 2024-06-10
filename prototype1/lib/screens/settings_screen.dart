import 'package:flutter/material.dart';
import 'package:prototype1/nav.dart';

class Ajustes extends StatelessWidget {
  const Ajustes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          backgroundColor: const Color.fromARGB(100, 239, 66, 124),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Notificaciones'),
              trailing: Switch(
                value: true,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              title: const Text('Navegacion Accesible'),
              trailing: Switch(
                value: false,
                onChanged: (bool value) {},
              ),
            ),
            ListTile(
              title: const Text('Idioma'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to language selection screen
              },
            ),
            ListTile(
              title: const Text('Acerca de'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to about screen
              },
            ),
          ],
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
