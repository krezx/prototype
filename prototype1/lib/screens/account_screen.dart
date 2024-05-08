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
        body: const Center(
          child: Text('Informacion de la cuenta...'),
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
