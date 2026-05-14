import '../entities/actividad.dart';

abstract class ActividadRepository {
  Future<List<Actividad>> getActividades();
}