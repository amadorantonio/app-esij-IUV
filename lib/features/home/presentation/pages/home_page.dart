import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/actividades/data/datasourses/actividades_remote_datasource.dart';
import 'package:app_escuela_judicial/features/actividades/data/repositories/actividad_repository_impl.dart';
import 'package:app_escuela_judicial/features/actividades/domain/usecases/get_actividades.dart';
import 'package:app_escuela_judicial/features/actividades/presentation/pages/actividades_page.dart';
import 'package:app_escuela_judicial/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:app_escuela_judicial/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:app_escuela_judicial/features/dashboard/domain/usecases/get_dashboard.dart';
import 'package:app_escuela_judicial/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:app_escuela_judicial/features/mis_cursos/data/datasources/cursos_inscritos_remote_datasource.dart';
import 'package:app_escuela_judicial/features/mis_cursos/data/repositories/curso_inscrito_repository_impl.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/usecases/get_cursos_inscritos.dart';
import 'package:app_escuela_judicial/features/mis_cursos/presentation/pages/mis_cursos_page.dart';
import 'package:flutter/material.dart';

final remoteDataSource = ActividadesRemoteDataSource();
final repository = ActividadRepositoryImpl(remoteDataSource);
final getActividades = GetActividades(repository);

final remoteDataSourceDashboard = DashboardRemoteDatasource();
final repositoryDashboard = DashboardRepositoryImpl(remoteDataSourceDashboard);
final getDashboard = GetDashboard(repositoryDashboard);

final remoteDatasourceMisCursos = CursosInscritosRemoteDataSource();

final repositoryMisCursos = CursoInscritoRepositoryImpl(
  remoteDatasourceMisCursos,
);

final getCursosInscritos = GetCursosInscritos(repositoryMisCursos);

class HomePage extends StatefulWidget {
  final NotificationLocalService notificationService;
  const HomePage({super.key, required this.notificationService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      ActividadesPage(
        getActividades: getActividades,
        notificationService: widget.notificationService,
      ),
      DashboardPage(getDashboard: getDashboard),
      MisCursosPage(
        getCursosInscritos: getCursosInscritos,
        notificationService: widget.notificationService,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        backgroundColor: Color(0xFF165375),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Actividades',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Mis Cursos'),
        ],
      ),
    );
  }
}
