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
        body: const Center(
          child: Text('Ajustes de la aplicación...'),
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
