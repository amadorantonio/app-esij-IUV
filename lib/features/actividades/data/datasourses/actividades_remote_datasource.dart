import 'dart:convert';
import 'package:http/http.dart' as http;

class ActividadesRemoteDataSource {
  final String _baseUrl = 'https://escuela.poderjudicial-gto.gob.mx/servicesescolar';

  Future<List<Map<String, dynamic>>> getActividades() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/calendario/spGetCalendarioAnual?fechaInicial=01-01-2020&fechaFinal=01-02-2020'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Error al obtener actividades');
    }
  }
}