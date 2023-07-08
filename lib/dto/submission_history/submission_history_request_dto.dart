import 'package:json_annotation/json_annotation.dart';

part 'submission_history_request_dto.g.dart';

@JsonSerializable()
class SubmissionHistoryRequestDto {
  SubmissionHistoryRequestDto(
      {
        required this.handle,
        required this.firstSubmissionIndex,
        required this.submissionsCount
      });

  factory SubmissionHistoryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionHistoryRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionHistoryRequestDtoToJson(this);

  @JsonKey(name: 'handle')
  final String handle;

  @JsonKey(name: 'from')
  final int firstSubmissionIndex;

  @JsonKey(name: 'count')
  final int submissionsCount;
}
