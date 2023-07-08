// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContestListResponseDto _$ContestListResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ContestListResponseDto(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      durationSeconds: json['durationSeconds'] as int,
      startTime: json['startTimeSeconds'] as int,
    );

Map<String, dynamic> _$ContestListResponseDtoToJson(
        ContestListResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'durationSeconds': instance.durationSeconds,
      'startTimeSeconds': instance.startTime,
    };
