import 'package:app_escuela_judicial/features/mis_cursos/data/datasources/cursos_inscritos_remote_datasource.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/entities/curso_inscrito.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/repositories/curso_inscrito_repository.dart';

class CursoInscritoRepositoryImpl implements CursoInscritoRepository {
  final CursosInscritosRemoteDataSource remoteDatasource;

  CursoInscritoRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<CursoInscrito>> getCursosInscritos() async {
    return await remoteDatasource.getCursosInscritos();
  }
}