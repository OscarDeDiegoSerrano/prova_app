import 'package:hive/hive.dart';

class Database {
    List llistaUsuaris = [];
    final _boxDeUsuaris = Hive.box("box_de_usuaris");

    void crearDadesInicials() {
      llistaUsuaris = [
        ["admin", "123", "admin", "admin", "123"],
      ];
    }

    void carregarDades() {
      
      llistaUsuaris = _boxDeUsuaris.get("box_de_usuaris");
    }

    void actualitzarDades() {

      _boxDeUsuaris.put("box_de_usuaris", llistaUsuaris);
    }

    bool verificarCredenciales(
      String username, String password) {
      String? _passwordController = _boxDeUsuaris.get(username);
      return _passwordController != null && _passwordController == password;
    }
  }
