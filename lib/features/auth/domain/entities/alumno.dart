import 'persona.dart';
import '../../../inscripciones/domain/entities/inscripcion.dart';

class Alumno extends Persona {
  String matricula;
  String rfc;
  String cargo;
  String idCentroTrabajo;
  String nombramiento;

  List<Inscripcion> inscripciones;

  Alumno({
    required this.matricula,
    required this.rfc,
    required this.cargo,
    required this.idCentroTrabajo,
    required this.nombramiento,
    this.inscripciones = const [],

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

  bool registrarInscripcion(String matricula, int idActividadAcademica) {
    return true;
  }

  void getInscripciones(String matricula) {}

  bool cancelarInscripcion(int idInscripcion) {
    return true;
  }
}
