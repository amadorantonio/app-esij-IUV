import 'package:app_escuela_judicial/data/local/database_helper.dart';
import 'package:app_escuela_judicial/features/dashboard/presentation/widgets/activities_comparison_chart.dart';
import 'package:app_escuela_judicial/features/dashboard/domain/entities/dashboard.dart';
import 'package:app_escuela_judicial/features/dashboard/domain/usecases/get_dashboard.dart';
import 'package:app_escuela_judicial/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:app_escuela_judicial/features/dashboard/presentation/widgets/horas_acreditadas.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DashboardPage extends StatefulWidget {
  final GetDashboard getDashboard;
  const DashboardPage({super.key, required this.getDashboard});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Dashboard? dashboard;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    cargarDashboard();
  }

  Future<bool> hayInternet() async {
  final result = await Connectivity().checkConnectivity();

  return !result.contains(ConnectivityResult.none);
}

  Future<void> cargarDashboard() async {
    /// Comprobar conexión a internet
    final online = await hayInternet();

    /// Intentar cargar desde SQLite
    final dashboardLocal = await DatabaseHelper.instance.getDashboard();

    if (dashboardLocal != null) {
      setState(() {
        dashboard = dashboardLocal;
        isLoading = false;
      });

      if (!online && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.amber,
            behavior: SnackBarBehavior.floating,
            content: Text('Mostrando datos almacenados localmente', style: TextStyle(color: Colors.black),),
          ),
        );
      }
    }

    /// Si no hay internet, salir
    if (!online) return;

    try {
      final resultado = await widget.getDashboard();
      setState(() {
        dashboard = resultado;
        isLoading = false;
      });
      await guardarDashboard(resultado);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Dashboard de ${dashboard!.nombre} guardado localmente',
          ),
        ),
      );
    } catch (e) {
      if (dashboard != null) return;
      setState(() {
        errorMessage = 'Error al cargar el dashboard';
        isLoading = false;
      });
    }
  }

  /// Función para cargar información de dashboard en SQLite y mostrar mensaje de éxito
  Future<void> guardarDashboard(Dashboard dashboardData) async {
    try {
      // Guardar en SQLite
      await DatabaseHelper.instance.insertDashboard(dashboardData);
    } catch (e) {
      print('Error al guardar el dashboard: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// LOADING
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFF165375))));
    }

    /// ERROR
    if (errorMessage != null) {
      return Scaffold(body: Center(child: Text(errorMessage!)));
    }

    /// SUCCESS
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header principal
              DashboardHeader(
                nombre: dashboard?.nombre ?? 'Usuario',
                totalActividades: dashboard?.numInscritas ?? 0,
              ),

              const SizedBox(height: 24),

              ActivitiesComparisonChart(
                inscritas: dashboard?.numInscritas ?? 0,
                acreditadas: dashboard?.numAcreditadas ?? 0,
              ),

              const SizedBox(height: 16),

              HorasAcreditadas(
                horasAcreditadas: dashboard?.horasAcreditadas ?? 0,
                totalHorasInscritas: dashboard?.totalHorasInscritas ?? 0,
                porcentajeProgreso: dashboard?.porcentajeProgreso ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
