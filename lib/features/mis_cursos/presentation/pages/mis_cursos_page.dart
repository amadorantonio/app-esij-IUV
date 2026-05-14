import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/entities/curso_inscrito.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/usecases/get_cursos_inscritos.dart';
import 'package:app_escuela_judicial/features/mis_cursos/presentation/widgets/curso_inscrito_card.dart';
import 'package:flutter/material.dart';

class MisCursosPage extends StatefulWidget {
  final GetCursosInscritos getCursosInscritos;
  final NotificationLocalService notificationService;

  const MisCursosPage({
    super.key,
    required this.getCursosInscritos,
    required this.notificationService,
  });

  @override
  State<MisCursosPage> createState() => _MisCursosPageState();
}

class _MisCursosPageState extends State<MisCursosPage> {

  List<CursoInscrito> cursos = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    cargarCursos();
  }

  Future<void> cargarCursos() async {
    try {
      final resultado = await widget.getCursosInscritos();

      setState(() {
        cursos = resultado;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error al cargar tus cursos inscritos';
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
      return Scaffold(
        body: Center(
          child: Text(errorMessage!),
        ),
      );
    }

    /// EMPTY
    if (cursos.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No tienes cursos inscritos'),
        ),
      );
    }

    /// SUCCESS
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Cursos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          return CursoInscritoCard(
            curso: cursos[index],
            notificationService: widget.notificationService,
          );
        },
      ),
    );
  }
}