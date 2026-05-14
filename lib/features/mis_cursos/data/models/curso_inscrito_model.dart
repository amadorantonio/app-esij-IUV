import 'package:app_escuela_judicial/features/mis_cursos/domain/entities/curso_inscrito.dart';

class CursoInscritoModel extends CursoInscrito {
  const CursoInscritoModel({
    required super.id,
    required super.titulo,
    required super.fechaInicio,
    required super.acredita,
    required super.tipoEvaluacion,
    required super.duracionHoras,
  });

  factory CursoInscritoModel.fromJson(Map<String, dynamic> json) {
    return CursoInscritoModel(
      id: json['IdProgramacionClase'].toString(),
      titulo: json['Nombre'] ?? '',
      fechaInicio: json['FechaInicio'] ?? '',
      acredita: json['AcreditaGeneral'] ?? '',
      tipoEvaluacion: json['TipoEvaluacion'] ?? '',
      duracionHoras: (json['DuracionHoras'] as num?)?.toDouble() ?? 0.0,
    );
  }
}