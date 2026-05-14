import 'package:app_escuela_judicial/features/mis_cursos/domain/entities/curso_inscrito.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/repositories/curso_inscrito_repository.dart';

class GetCursosInscritos {
  final CursoInscritoRepository repository;

  GetCursosInscritos(this.repository);

  Future<List<CursoInscrito>> call() async {
    return await repository.getCursosInscritos();
  }
}
