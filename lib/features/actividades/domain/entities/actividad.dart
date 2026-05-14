import '../../../inscripciones/domain/entities/inscripcion.dart';
import '../../../notificaciones/domain/entities/notificacion.dart';
import 'sesion.dart';

class Actividad {
  final int id;
  final String titulo;
  final String tipo;
  final String estatus;
  final String destinatarios;
  final String fechaInicio;
  final String fechaFin;
  final String fechaLimite;
  final int convocados;
  final int inscritos;
  final String sede;

  List<Inscripcion> inscripciones;
  List<Notificacion> notificaciones;
  List<Sesion> sesiones;

  Actividad({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.estatus,
    required this.destinatarios,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fechaLimite,
    required this.convocados,
    required this.inscritos,
    required this.sede,
    this.inscripciones = const [],
    this.notificaciones = const [],
    this.sesiones = const [], 
  });
}
