import 'package:flutter/material.dart';

class HorasAcreditadas extends StatelessWidget {
  final double horasAcreditadas;
  final double totalHorasInscritas;
  final double porcentajeProgreso;
  const HorasAcreditadas({
    super.key,
    required this.horasAcreditadas,
    required this.totalHorasInscritas,
    required this.porcentajeProgreso,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Horas acreditadas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          LinearProgressIndicator(
            value: porcentajeProgreso,
            minHeight: 12,
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF1A6BA0),
            backgroundColor: Colors.white,
          ),

          const SizedBox(height: 16),

          Text(
            '$horasAcreditadas / '
            '$totalHorasInscritas horas',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
