// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteWorkModel _$RemoteWorkModelFromJson(Map<String, dynamic> json) {
  return RemoteWorkModel(
    json['ID'] as int,
    json['post_title'] as String,
    json['tipo'] as String,
    json['descricao'] as String,
    json['formacao_em_portugues'] as String,
    json['como_aceder'] as String,
    json['suporte_tecnico'] as String,
  );
}

Map<String, dynamic> _$RemoteWorkModelToJson(RemoteWorkModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('tipo', instance.remoteWorkType);
  writeNotNull('post_title', instance.postTitle);
  writeNotNull('descricao', instance.description);
  writeNotNull('formacao_em_portugues', instance.trainingInPortuguese);
  writeNotNull('como_aceder', instance.howToAccess);
  writeNotNull('suporte_tecnico', instance.technicalSupportUri);
  return val;
}
