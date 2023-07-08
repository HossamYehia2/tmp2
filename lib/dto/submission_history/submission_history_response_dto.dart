import 'package:json_annotation/json_annotation.dart';

import '../problem/problem_dto.dart';

part 'submission_history_response_dto.g.dart';

@JsonSerializable()
class SubmissionHistoryResponseDto {
  SubmissionHistoryResponseDto(
      {
        this.submissionId,
        this.contestId,
        this.problem,
        this.verdict,
      });

  factory SubmissionHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionHistoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionHistoryResponseDtoToJson(this);

  @JsonKey(name: 'id')
  final int? submissionId;

  @JsonKey(name: 'contestId')
  final int? contestId;

  @JsonKey(name: 'problem')
  final ProblemDto? problem;

  @JsonKey(name: 'verdict')
  final String? verdict;

  String? solutionLink;
}
