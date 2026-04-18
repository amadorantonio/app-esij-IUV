import '../../../inscripciones/domain/entities/inscripcion.dart';
import '../../../notificaciones/domain/entities/notificacion.dart';
import 'sesion.dart';

class Actividad {
  int idActividad;
  String nombre;
  String tipo;
  bool visible;
  String criterioEvaluacion;
  String objetivo;
  String convocados;
  String sede;

  List<Inscripcion> inscripciones;
  List<Notificacion> notificaciones;
  List<Sesion> sesiones;

  Actividad({
    required this.idActividad,
    required this.nombre,
    required this.tipo,
    required this.visible,
    required this.criterioEvaluacion,
    required this.objetivo,
    required this.convocados,
    required this.sede,
    this.inscripciones = const [],
    this.notificaciones = const [],
    this.sesiones = const [],
  });

  bool actualizar(Actividad actividad) {
    return true;
  }

  void getDatosPorId(int idActividad) {}

  void getDatos() {}
}
