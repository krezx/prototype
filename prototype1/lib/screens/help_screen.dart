import 'package:flutter/material.dart';
import 'package:prototype1/nav.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ayuda'),
          backgroundColor: const Color.fromARGB(100, 239, 66, 124),
        ),
        body: const Center(
          child: Text('Información de Ayuda'),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
