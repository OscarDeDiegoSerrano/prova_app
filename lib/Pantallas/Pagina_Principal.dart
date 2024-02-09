import 'package:flutter/material.dart';

class Pagina_Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Principal')),
      body: Center(
        child: Text('¡Bienvenido!'),
      ),
    );
  }
}
