import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'Pagina_Principal.dart'; // Importa la página principal
import 'database.dart'; // Importa la clase Database

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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

  void ferLogin() {
    String usernameEscrit = _usernameController.text;
    String passwordEscrit = _passwordController.text;

    bool credencialesCorrectas = bd.verificarCredenciales(usernameEscrit, passwordEscrit);

    if (credencialesCorrectas) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Pagina_Principal()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Usuario',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su usuario';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su contraseña';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: ferLogin,
            
            child: Text('Iniciar Sesión'),
          ),
        ],
      ),
    );
  }
}
