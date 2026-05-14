import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/actividades/domain/entities/actividad.dart';
import 'package:app_escuela_judicial/features/actividades/domain/usecases/get_actividades.dart';
import 'package:app_escuela_judicial/features/actividades/presentation/widgets/actividad_card.dart';
import 'package:flutter/material.dart';

class ActividadesPage extends StatefulWidget {
  final GetActividades getActividades;
  final NotificationLocalService notificationService;

  const ActividadesPage({
    super.key,
    required this.getActividades,
    required this.notificationService,
  });

  @override
  State<ActividadesPage> createState() => _ActividadesPageState();
}

class _ActividadesPageState extends State<ActividadesPage> {
  List<Actividad> actividades = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    cargarActividades();
  }

  Future<void> cargarActividades() async {
    try {
      final resultado = await widget.getActividades();
      setState(() {
        actividades = resultado;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('ERROR ACTIVIDADES: $e');

      setState(() {
        errorMessage = '$e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// LOADING
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF165375)),
        ),
      );
    }

    /// ERROR
    if (errorMessage != null) {
      return Scaffold(body: Center(child: Text(errorMessage!)));
    }

    /// SUCCESS
    return Scaffold(
      appBar: AppBar(title: const Text('Actividades Disponibles')),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: actividades.length,

        itemBuilder: (context, index) {
          return ActividadCard(
            actividad: actividades[index],
            notificationService: widget.notificationService,
          );
        },
      ),
    );
  }
}
