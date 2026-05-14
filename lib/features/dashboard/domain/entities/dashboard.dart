class Dashboard {
  final String nombre;
  final String puesto;
  final String centroTrabajo;
  final int numAcreditadas;
  final int numInscritas;
  final double horasAcreditadas;

  final List<InscritasDashboard> inscritas;

  Dashboard({
    required this.nombre,
    required this.puesto,
    required this.centroTrabajo,
    required this.numAcreditadas,
    required this.numInscritas,
    required this.horasAcreditadas,
    this.inscritas = const [],
  });

  double get totalHorasInscritas {
    return inscritas.fold(
      0,
      (total, inscrita) => total + inscrita.duracionHoras,
    );
  }

  double get porcentajeProgreso {
    if (totalHorasInscritas == 0) return 0;

    return horasAcreditadas / totalHorasInscritas;
  }
}

class InscritasDashboard {
  final String nombre;
  final String fechaInicio;
  final String acreditacionAsistencia;
  final String tipoEvaluacion;
  final double duracionHoras;
  final String acreditacionGeneral;

  InscritasDashboard({
    required this.nombre,
    required this.fechaInicio,
    required this.acreditacionAsistencia,
    required this.tipoEvaluacion,
    required this.duracionHoras,
    required this.acreditacionGeneral,
  });
}