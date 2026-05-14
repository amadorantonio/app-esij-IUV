import 'package:app_escuela_judicial/features/actividades/domain/entities/actividad.dart';

class ActividadModel extends Actividad {


  ActividadModel({
    required super.id,
    required super.titulo,
    required super.tipo,
    required super.estatus,
    required super.destinatarios,
    required super.fechaInicio,
    required super.fechaFin,
    required super.fechaLimite,
    required super.convocados,
    required super.inscritos,
    required super.sede,
  });

  factory ActividadModel.fromJson(Map<String, dynamic> json) {
    return ActividadModel(
      id: json['IdProgramacion'],
      titulo: json['NombreActividad'],
      tipo: json['TipoActividad'],
      estatus: json['Estatus'],
      destinatarios: json['Destinatarios'],
      fechaInicio: json['FechaInicio'],
      fechaFin: json['FechaFin'],
      fechaLimite: json['FechaLimite'],
      convocados: json['Convocados'],
      inscritos: json['Inscritos'],
      sede: json['Sede'],
    );
  }
}