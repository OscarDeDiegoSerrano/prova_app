import 'package:flutter/material.dart';
import 'package:prova_app/Pantallas/Pagina_Principal.dart'; // Importa la pantalla principal
import 'package:prova_app/Pantallas/database.dart'; // Importa la clase Database

class Registro extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _registerUser(context); // Llama al método para registrar al usuario
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Acceder a la instancia de Database
    final databaseInstance = Database.instance;

    // Guardar datos en la base de datos
    await databaseInstance.insertUser(username, password);

    // Navegar a la pantalla principal
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Pagina_Principal()), // Usa PaginaPrincipal en lugar de Pagina_Principal
    );
  }
}

