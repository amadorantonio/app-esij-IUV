import '../../../auth/domain/entities/alumno.dart';
import '../../../actividades/domain/entities/actividad.dart';

class Inscripcion {
  int idInscripcion;
  DateTime fecha;
  bool estatus;

  Alumno alumno;
  Actividad actividad;

  Inscripcion({
    required this.idInscripcion,
    required this.estatus,
    required this.fecha,
    required this.alumno,
    required this.actividad,
  });

  bool registrar(String matricula, int idActividadAcademica) {
    return true;
  }

  bool cancelar(int idInscripcion) {
    return true;
  }

  void getDatos(String matricula) {}
}
