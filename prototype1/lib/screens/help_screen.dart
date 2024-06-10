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
          title: const Text('Centros de Ayuda'),
          backgroundColor: const Color.fromARGB(100, 239, 66, 124),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Programa para víctimas de violencia de género grave o extrema:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Atención integral, psicosocial, jurídica, psiquiátrica y recuperación de las autonomías económicas para las mujeres. Esta será profunda y especializada, buscando disminuir de alguna manera las violencias de género que siguen sucediendo en el país.\nOperará desde fines de mayo la etapa piloto, será un beneficio directo para quienes consulten de manera espontánea y también para usuarias derivadas de Tribunales o Fiscalía.',
              ),
              SizedBox(height: 16),
              Text(
                'Fonos Denuncia:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                  'Fono de orientación para la violencia contra la mujer: 1455'),
              Text('Fono familia de Carabineros: 149'),
              Text('PDI: 134'),
              Text(
                  'Denuncia Seguro de PDI (pueden ser denuncias como testigo, de carácter anónimo): *4242'),
              SizedBox(height: 16),
              Text(
                'Centros de la Mujer:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text('Centro de la Mujer Sernameg - La Serena'),
              Text('Centro de la Mujer Liwen'),
              Text('Horario: 08:30 a 17:30 horas.'),
              Text('Contacto: 51-2641850 / 51-2427844 / 961244738'),
              Text('Correo: centroliwen@laserena.cl'),
            ],
          ),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
