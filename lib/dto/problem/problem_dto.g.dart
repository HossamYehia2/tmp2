// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemDto _$ProblemDtoFromJson(Map<String, dynamic> json) => ProblemDto(
      contestId: json['contestId'] as int,
      index: json['index'] as String,
      name: json['name'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProblemDtoToJson(ProblemDto instance) =>
    <String, dynamic>{
      'contestId': instance.contestId,
      'index': instance.index,
      'name': instance.name,
      'tags': instance.tags,
    };
