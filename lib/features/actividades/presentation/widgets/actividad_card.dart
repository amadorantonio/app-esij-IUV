import 'package:app_escuela_judicial/core/services/notification_local_service.dart';
import 'package:app_escuela_judicial/features/actividades/domain/entities/actividad.dart';
import 'package:flutter/material.dart';

class ActividadCard extends StatelessWidget {
  final Actividad actividad;
  final NotificationLocalService notificationService;

  const ActividadCard({
    super.key,
    required this.actividad,
    required this.notificationService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      elevation: 3,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: ExpansionTile(
        leading: const Icon(Icons.school),
        iconColor: Color(0xFF165375),

        title: Text(actividad.titulo),
        subtitle: Text('Fecha de inicio: ${actividad.fechaInicio}'),
        childrenPadding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(Icons.alarm_on),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Fecha límite de inscripción: ${actividad.fechaLimite}',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.lock_clock),
              SizedBox(width: 8),
              Expanded(
                child: Text('Fecha de finalización: ${actividad.fechaFin}'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.type_specimen),
              SizedBox(width: 8),
              Expanded(child: Text('Tipo de actividad: ${actividad.tipo}')),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.done),
              SizedBox(width: 8),
              Expanded(child: Text('Estatus: ${actividad.estatus}')),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.people),
              SizedBox(width: 8),
              Expanded(
                child: Text('Destinatarios: ${actividad.destinatarios}'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.format_list_numbered),
              SizedBox(width: 8),
              Expanded(
                child: Text('Lugares disponibles: ${actividad.convocados}'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 8),
              Expanded(child: Text('Sede: ${actividad.sede}')),
            ],
          ),

          const SizedBox(height: 16),

          Align(
            alignment: Alignment.centerRight,

            child: FilledButton(
              onPressed: () async {
                await notificationService.mostrarNotificacion(
                  titulo: 'Inscripción exitosa',
                  mensaje:
                      'Te has inscrito en la actividad ${actividad.titulo} con éxito.',
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xFF165375),
                foregroundColor: Colors.white,
              ),
              child: const Text('Inscribirse'),
            ),
          ),
        ],
      ),
    );
  }
}
