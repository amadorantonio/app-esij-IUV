import 'package:app_escuela_judicial/features/mis_cursos/domain/entities/curso_inscrito.dart';

abstract class CursoInscritoRepository {
  Future<List<CursoInscrito>> getCursosInscritos();
}