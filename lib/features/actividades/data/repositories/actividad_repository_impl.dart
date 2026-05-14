import 'package:app_escuela_judicial/features/actividades/data/datasourses/actividades_remote_datasource.dart';
import 'package:app_escuela_judicial/features/actividades/domain/entities/actividad.dart';
import 'package:app_escuela_judicial/features/actividades/domain/repositories/actividad_repository.dart';

class ActividadRepositoryImpl implements ActividadRepository {

  final ActividadesRemoteDataSource remoteDataSource;

  ActividadRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Actividad>> getActividades() async {

    final actividades = await remoteDataSource.getActividades();

    return actividades.cast<Actividad>();
  }
}