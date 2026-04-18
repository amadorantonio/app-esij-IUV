import 'actividad.dart';
import 'aula.dart';

class Sesion {
  int idSesion;
  DateTime fechaInicio;
  DateTime fechaFin;
  Duration duracion;

  Actividad actividad;
  Aula aula;

  Sesion({
    required this.idSesion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.duracion,
    required this.actividad,
    required this.aula,
  });

  void getDatos() {}

  void getDatosPorIdActividad(int idActividad) {}
}
