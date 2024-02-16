import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prova_app/Pantallas/LogIn.dart';
import 'package:prova_app/Pantallas/database.dart';

class Registro extends StatefulWidget {
  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _apellidoController = TextEditingController();

  final TextEditingController _telefonoController = TextEditingController();

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
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _apellidoController,
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: _telefonoController,
              decoration: InputDecoration(labelText: 'Telefono'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _registerUser(context);
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  final _boxDeUsuaris = Hive.box("box_de_usuaris");

   Database bd = Database();

  @override
  void initState(){
    if (_boxDeUsuaris.get("box_de_usuaris") == null) {

        bd.crearDadesInicials();

      } else {

        bd.carregarDades();
      }

      super.initState();
    
    }

  void _registerUser(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    final apellido = _apellidoController.text;
    final telefono = _telefonoController.text;


    bd.llistaUsuaris.add([username, password, name, apellido, telefono]);
    bd.actualitzarDades();

    // Una vez registrado exitosamente, redirige al usuario a la página de inicio de sesión
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Redirige a la página de inicio de sesión
    );
  }
}
