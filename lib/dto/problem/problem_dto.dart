import 'package:json_annotation/json_annotation.dart';

part 'problem_dto.g.dart';

@JsonSerializable()
class ProblemDto {
  ProblemDto(
      {
        required this.contestId,
        required this.index,
        required this.name,
        required this.tags,
      });

  factory ProblemDto.fromJson(Map<String, dynamic> json) =>
      _$ProblemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemDtoToJson(this);

  @JsonKey(name: 'contestId')
  final int contestId;

  @JsonKey(name: 'index')
  final String index;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'tags')
  final List<String> tags;
}
