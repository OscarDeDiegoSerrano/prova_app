import 'package:hive/hive.dart';

class Database {
  final Box _box;

  static Database? _instance;

  Database._(this._box);

  static Database get instance {
    _instance ??= Database._(Hive.box("box_de_tasques"));
    return _instance!;
  }

  // Método para insertar un usuario en la base de datos
  Future<void> insertUser(String username, String password) async {
  }

  // Método para el inicio de sesión de usuarios
  Future<bool> logIn(String username, String password) async {
    return true;
  }

  void crearDadesInicials() {
    // Lógica para crear datos iniciales
  }

  void carregarDades() {
    // Lógica para cargar datos
  }

  void actualitzarDades() {
    // Lógica para actualizar datos
  }
}
