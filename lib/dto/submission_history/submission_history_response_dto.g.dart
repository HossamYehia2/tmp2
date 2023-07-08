// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionHistoryResponseDto _$SubmissionHistoryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SubmissionHistoryResponseDto(
      submissionId: json['id'] as int?,
      contestId: json['contestId'] as int?,
      problem: json['problem'] == null
          ? null
          : ProblemDto.fromJson(json['problem'] as Map<String, dynamic>),
      verdict: json['verdict'] as String?,
    )..solutionLink = json['solutionLink'] as String?;

Map<String, dynamic> _$SubmissionHistoryResponseDtoToJson(
        SubmissionHistoryResponseDto instance) =>
    <String, dynamic>{
      'id': instance.submissionId,
      'contestId': instance.contestId,
      'problem': instance.problem,
      'verdict': instance.verdict,
      'solutionLink': instance.solutionLink,
    };
