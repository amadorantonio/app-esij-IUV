import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/curso_inscrito_model.dart';

class CursosInscritosRemoteDataSource {
  final String _baseUrl = 'https://escuela.poderjudicial-gto.gob.mx/servicesescolar';

  Future<List<CursoInscritoModel>> getCursosInscritos() async {
     final response = await http.get(
      Uri.parse('$_baseUrl/actividades/GetActividadesCapacitacionByMatricula?matricula=20170652'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final inscritas = data['Inscritas'] as List;
      
       return inscritas
          .map((json) => CursoInscritoModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error al obtener cursos inscritos');
    }
  }
}