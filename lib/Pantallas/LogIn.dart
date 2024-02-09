import 'package:flutter/material.dart';
import 'package:prova_app/Pantallas/database.dart';
import 'package:prova_app/Pantallas/Pagina_Principal.dart';



class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
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
                _login(context);
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Comprobar credenciales en la base de datos
    final isValid = await Database.instance.logIn(username, password);

    if (isValid) {
      // Credenciales correctas, navegar a la pantalla principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pagina_Principal()),
      );
    } else {
      // Credenciales incorrectas, mostrar mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Credenciales incorrectas'),
      ));
    }
  }
}
