import 'package:flutter/material.dart';
import 'package:prova_app/Pantallas/Registro.dart';

class draw extends StatelessWidget {
  const draw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pagina Oscar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Pagina Principal'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Pagina_Principal');
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Registro');
              },
            ),
          ],
        ),
      ),
      body: Registro(),
    );
  }
}
