

import 'dart:convert';
import 'package:app_escuela_judicial/features/dashboard/data/models/dashboard_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DashboardRemoteDatasource {
  final String _baseUrl = 'https://escuela.poderjudicial-gto.gob.mx/servicesescolar';

  Future<DashboardModel> getDashboard() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/actividades/GetActividadesCapacitacionByMatricula?matricula=20170652'),
    );


    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return DashboardModel.fromJson(data);
    } else {
      throw Exception('Error al obtener dashboard');
    }
  }
}