import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivitiesComparisonChart extends StatelessWidget {
  final int inscritas;
  final int acreditadas;

  const ActivitiesComparisonChart({
    super.key,
    required this.inscritas,
    required this.acreditadas,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        color: theme.colorScheme.surface,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Actividades académicas', style: theme.textTheme.titleLarge),

          const SizedBox(height: 24),

          SizedBox(
            height: 250,

            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,

                maxY:
                    (inscritas > acreditadas ? inscritas : acreditadas)
                        .toDouble() +
                    5,

                borderData: FlBorderData(show: false),

                gridData: const FlGridData(show: false),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 32),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('Inscritas');

                          case 1:
                            return const Text('Acreditadas');
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                ),

                barGroups: [
                  /// Inscritas
                  BarChartGroupData(
                    x: 0,

                    barRods: [
                      BarChartRodData(
                        toY: inscritas.toDouble(),

                        width: 40,

                        borderRadius: BorderRadius.circular(8),

                        color: Color(0xFF1A6BA0),
                      ),
                    ],
                  ),

                  /// Acreditadas
                  BarChartGroupData(
                    x: 1,

                    barRods: [
                      BarChartRodData(
                        toY: acreditadas.toDouble(),

                        width: 40,

                        borderRadius: BorderRadius.circular(8),

                        color: theme.colorScheme.tertiary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
