import 'persona.dart';

class Empleado extends Persona {
  String gradoAcademico;

  Empleado({
    required this.gradoAcademico,

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
