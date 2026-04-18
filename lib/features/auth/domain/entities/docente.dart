import 'persona.dart';
import '../../../actividades/domain/entities/sesion.dart';

class Docente extends Persona {
  int numeroEmpleado;
  String puesto;

  List<Sesion> sesiones;

  Docente({
    required this.numeroEmpleado,
    required this.puesto,
    required this.sesiones,

    required super.idPersona,
    required super.nombre,
    required super.apellidoPaterno,
    required super.apellidoMaterno,
    required super.sexo,
    required super.telefono,
    required super.correoElectronico,
    required super.contrasena,
    required super.estatus,
  });
}
