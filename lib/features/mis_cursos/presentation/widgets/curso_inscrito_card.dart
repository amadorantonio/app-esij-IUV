import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/mis_cursos/domain/entities/curso_inscrito.dart';
import 'package:flutter/material.dart';

class CursoInscritoCard extends StatelessWidget {
  final CursoInscrito curso;
  final NotificationLocalService notificationService;

  const CursoInscritoCard({
    super.key,
    required this.curso,
    required this.notificationService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.school, color: Color(0xFF165375)),
                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    curso.titulo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text('Inicio: ${curso.fechaInicio}')),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.verified, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text('Acredita: ${curso.acredita}')),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.assignment, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text('Evaluación: ${curso.tipoEvaluacion}')),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.timer, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text('Duración: ${curso.duracionHoras} horas')),
              ],
            ),

            const SizedBox(height: 20),

            if (curso.acredita.toUpperCase() != 'SI')
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: () async {
                    await notificationService.mostrarNotificacion(
                      titulo: 'Baja exitosa',
                      mensaje:
                          'Te has dado de baja en la actividad ${curso.titulo} con éxito.',
                    );
                  },
                  icon: const Icon(Icons.cancel),
                  label: const Text('Darse de baja'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              )
            else
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('Descargar constancia'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
