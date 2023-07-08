// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_history_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionHistoryRequestDto _$SubmissionHistoryRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SubmissionHistoryRequestDto(
      handle: json['handle'] as String,
      firstSubmissionIndex: json['from'] as int,
      submissionsCount: json['count'] as int,
    );

Map<String, dynamic> _$SubmissionHistoryRequestDtoToJson(
        SubmissionHistoryRequestDto instance) =>
    <String, dynamic>{
      'handle': instance.handle,
      'from': instance.firstSubmissionIndex,
      'count': instance.submissionsCount,
    };
