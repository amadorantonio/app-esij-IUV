import 'package:app_escuela_judicial/features/actividades/domain/entities/actividad.dart';
import 'package:app_escuela_judicial/features/actividades/domain/repositories/actividad_repository.dart';

class GetActividades {
  final ActividadRepository repository;

  GetActividades(this.repository);

  Future<List<Actividad>> call() async {
    return await repository.getActividades();
  }
}