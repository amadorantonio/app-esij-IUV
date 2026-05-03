import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('actividades.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print("🔍 ~ _initDB ~ lib/data/local/database_helper.dart:18 ~ path:" + path);
    

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE actividades (
        id INTEGER PRIMARY KEY,
        NombreActividad TEXT,
        Destinatarios TEXT
      )
    ''');
  }

  Future<int> insertActividad(Map<String, dynamic> actividad) async {
  final db = await instance.database;
  return await db.insert('actividades', {
    'NombreActividad': actividad['NombreActividad'],
    'Destinatarios': actividad['Destinatarios'],});
  }

  Future<List<Map<String, dynamic>>> getActividades() async {
    final db = await instance.database;
    return await db.query('actividades');
  }

  Future<int> deleteActividad(int id) async {
    final db = await instance.database;
    return await db.delete(
      'actividades',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

