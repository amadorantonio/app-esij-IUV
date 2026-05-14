import '../../domain/entities/dashboard.dart';

class DashboardModel extends Dashboard {
  DashboardModel({
    required super.nombre,
    required super.puesto,
    required super.centroTrabajo,
    required super.numAcreditadas,
    required super.numInscritas,
    required super.horasAcreditadas,
    super.inscritas,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      nombre: json['Nombre'] ?? '',
      puesto: json['Puesto'] ?? '',
      centroTrabajo: json['CentroTrabajo'] ?? '',
      numAcreditadas: json['NumAcreditadas'] ?? '',
      numInscritas: json['NumInscritas'] ?? '',
      horasAcreditadas: json['HorasAcreditadas'] ?? '',
      inscritas:
              (json['Inscritas'] as List<dynamic>?)
            ?.map<InscritasDashboard>(
              (e) => InscritasDashboardModel.fromJson(e),
            )
            .toList() ??
        [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'puesto': puesto,
      'centroTrabajo': centroTrabajo,
      'numAcreditadas': numAcreditadas,
      'numInscritas': numInscritas,
      'horasAcreditadas': horasAcreditadas,
      'Inscritas':
          inscritas
              .map(
                (e) => InscritasDashboardModel(
                  nombre: e.nombre,
                  fechaInicio: e.fechaInicio,
                  acreditacionAsistencia: e.acreditacionAsistencia,
                  tipoEvaluacion: e.tipoEvaluacion,
                  acreditacionGeneral: e.acreditacionGeneral,
                  duracionHoras: e.duracionHoras,
                ).toJson(),
              )
              .toList(),
    };
  }
}

class InscritasDashboardModel extends InscritasDashboard {
  InscritasDashboardModel({
    required super.nombre,
    required super.fechaInicio,
    required super.acreditacionAsistencia,
    required super.tipoEvaluacion,
    required super.acreditacionGeneral,
    required super.duracionHoras,
  });

  factory InscritasDashboardModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return InscritasDashboardModel(
      nombre: json['Nombre'] ?? '',
      fechaInicio: json['FechaInicio'] ?? '',
      acreditacionAsistencia: json['AcreditaAsistencia'] ?? '',
      tipoEvaluacion: json['TipoEvaluacion'] ?? '',
      acreditacionGeneral: json['AcreditaGeneral'] ?? '',
      duracionHoras: json['DuracionHoras'].toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'fechaInicio': fechaInicio,
      'acreditacionAsistencia': acreditacionAsistencia,
      'tipoEvaluacion': tipoEvaluacion,
      'acreditacionGeneral': acreditacionGeneral,
      'duracionHoras': duracionHoras,
    };
  }
}