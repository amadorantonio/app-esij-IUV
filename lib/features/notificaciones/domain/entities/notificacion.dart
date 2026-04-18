import '../../../actividades/domain/entities/actividad.dart';

class Notificacion {
  int idNotificacion;
  String titulo;
  String mensaje;
  String icono;
  DateTime fechaEnvio;

  Actividad actividad;

  Notificacion({
    required this.idNotificacion,
    required this.titulo,
    required this.mensaje,
    required this.icono,
    required this.fechaEnvio,
    required this.actividad,
  });

  bool enviarNotificacion(Notificacion notificacion) {
    return true;
  }
}
