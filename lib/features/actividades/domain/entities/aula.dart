import 'sesion.dart';

class Aula {
  int idAula;
  String nombre;
  String tipo;
  String municipio;
  int capacidad;

  List<Sesion> sesiones;

  Aula({
    required this.idAula,
    required this.nombre,
    required this.tipo,
    required this.municipio,
    required this.capacidad,
    required this.sesiones,
  });

  void getDatos(int idAula) {}
}
