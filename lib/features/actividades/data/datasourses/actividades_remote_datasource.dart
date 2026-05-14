import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/actividad_model.dart';

class ActividadesRemoteDataSource {
  final String _baseUrl = 'https://escuela.poderjudicial-gto.gob.mx/servicesescolar';

  Future<List<ActividadModel>> getActividades() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/calendario/spGetCalendarioAnual?fechaInicial=01-04-2026&fechaFinal=01-05-2026'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      
      return (data as List)
        .map((json){
          return ActividadModel.fromJson(json);
      }).toList();
    } else {
      throw Exception('Error al obtener actividades');
    }
  }
}