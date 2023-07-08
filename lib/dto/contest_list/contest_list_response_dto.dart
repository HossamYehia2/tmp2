import 'package:json_annotation/json_annotation.dart';

part 'contest_list_response_dto.g.dart';

@JsonSerializable()
class ContestListResponseDto {
  ContestListResponseDto(
      {
        required this.id,
        required this.name,
        required this.type,
        required this.durationSeconds,
        required this.startTime,
      });

  factory ContestListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ContestListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ContestListResponseDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'durationSeconds')
  final int durationSeconds;

  @JsonKey(name: 'startTimeSeconds')
  final int startTime;
}
