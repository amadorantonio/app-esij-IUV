import 'package:app_escuela_judicial/features/dashboard/domain/entities/dashboard.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('esij.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE dashboard (
        id INTEGER PRIMARY KEY,
        nombre TEXT,
        puesto TEXT,
        centroTrabajo TEXT,
        numAcreditadas INTEGER,
        numInscritas INTEGER,
        horasAcreditadas REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE dashboard_inscritas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dashboardId INTEGER,
      nombre TEXT,
      fechaInicio TEXT,
      acreditacionAsistencia TEXT,
      tipoEvaluacion TEXT,
      duracionHoras REAL,
      acreditacionGeneral TEXT
    )
    ''');
  }

  Future<int> insertDashboard(Dashboard dashboard) async {
    final db = await instance.database;
    await db.delete('dashboard');
    await db.delete(' dashboard_inscritas');
    final dashboardId = await db.insert('dashboard', {
      'nombre': dashboard.nombre,
      'puesto': dashboard.puesto,
      'centroTrabajo': dashboard.centroTrabajo,
      'numAcreditadas': dashboard.numAcreditadas,
      'numInscritas': dashboard.numInscritas,
      'horasAcreditadas': dashboard.horasAcreditadas,
    });
    for (final inscrita in dashboard.inscritas) {
      await db.insert('dashboard_inscritas', {
        'dashboardId': dashboardId,
        'nombre': inscrita.nombre,
        'fechaInicio': inscrita.fechaInicio,
        'acreditacionAsistencia': inscrita.acreditacionAsistencia,
        'tipoEvaluacion': inscrita.tipoEvaluacion,
        'duracionHoras': inscrita.duracionHoras,
        'acreditacionGeneral': inscrita.acreditacionGeneral,
      });
    }
    return dashboardId;
  }

  Future<Dashboard?> getDashboard() async {
    final db = await instance.database;

    final dashboardResult = await db.query('dashboard');
    final dashboardData = dashboardResult.first;
    final dashboardId = dashboardData['id'];

    final inscritasResult = await db.query(
      'dashboard_inscritas',
      where: 'dashboardId = ?',
      whereArgs: [dashboardId],
    );

    final inscritas = inscritasResult.map((e) {
      return InscritasDashboard(
        nombre: e['nombre'] as String,
        fechaInicio: e['fechaInicio'] as String,
        acreditacionAsistencia: e['acreditacionAsistencia'] as String,
        tipoEvaluacion: e['tipoEvaluacion'] as String,
        duracionHoras: e['duracionHoras'] as double,
        acreditacionGeneral: e['acreditacionGeneral'] as String,
      );
    }).toList();

    if (dashboardResult.isEmpty) return null;

    return Dashboard(
      nombre: dashboardData['nombre'] as String,
      puesto: dashboardData['puesto'] as String,
      centroTrabajo: dashboardData['centroTrabajo'] as String,
      numAcreditadas: dashboardData['numAcreditadas'] as int,
      numInscritas: dashboardData['numInscritas'] as int,
      horasAcreditadas: dashboardData['horasAcreditadas'] as double,
      inscritas: inscritas,
    );
  }
}
