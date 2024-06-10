import 'package:flutter/material.dart';
import 'package:prototype1/nav.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cuenta'),
          backgroundColor: const Color.fromARGB(100, 239, 66, 124),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FlutterLogo(size: 42.0),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Nombre'),
                subtitle: const Text('John Doe'),
                onTap: () {
                  // Navegar a la pantalla de edición de nombre
                },
              ),
              ListTile(
                title: const Text('Correo Electrónico'),
                subtitle: const Text('john.doe@example.com'),
                onTap: () {
                  // Navegar a la pantalla de edición de correo electrónico
                },
              ),
              ListTile(
                title: const Text('Contraseña'),
                subtitle: const Text('********'),
                onTap: () {
                  // Navegar a la pantalla de edición de contraseña
                },
              ),
              ListTile(
                title: const Text('Número de Teléfono'),
                subtitle: const Text('+1234567890'),
                onTap: () {
                  // Navegar a la pantalla de edición de número de teléfono
                },
              ),
              ListTile(
                title: const Text('Dirección'),
                subtitle: const Text('123 Calle Principal'),
                onTap: () {
                  // Navegar a la pantalla de edición de dirección
                },
              ),
              ListTile(
                title: const Text('Institución Educacional'),
                subtitle: const Text('Universidad Central'),
                onTap: () {
                  // Navegar a la pantalla de edición de dirección
                },
              ),
              ListTile(
                title: const Text('Contacto de Emergencias'),
                subtitle: const Text('Papá: +1234567890'),
                onTap: () {
                  // Navegar a la pantalla de edición de dirección
                },
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
