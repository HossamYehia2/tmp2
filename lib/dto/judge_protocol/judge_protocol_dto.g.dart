// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'judge_protocol_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JudgeProtocolDto _$JudgeProtocolDtoFromJson(Map<String, dynamic> json) =>
    JudgeProtocolDto(
      protocol: json['protocol'] as String,
      manual: json['manual'] as String,
      verdict: json['verdict'] as String,
    );

Map<String, dynamic> _$JudgeProtocolDtoToJson(JudgeProtocolDto instance) =>
    <String, dynamic>{
      'protocol': instance.protocol,
      'manual': instance.manual,
      'verdict': instance.verdict,
    };
