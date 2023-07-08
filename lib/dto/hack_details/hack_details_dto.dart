import 'package:first_app/dto/problem/problem_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hack_details_dto.g.dart';

@JsonSerializable()
class HackDetailsDto {
  HackDetailsDto(
      {
        required this.hackId,
        required this.hackTime,
        required this.hackerName,
        required this.verdict,
        required this.problemDto,
      });

  factory HackDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$HackDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HackDetailsDtoToJson(this);

  @JsonKey(name: 'hackId')
  final int hackId;

  @JsonKey(name: 'creationTimeSeconds')
  final int hackTime;

  @JsonKey(name: 'hackerName')
  final String hackerName;

  @JsonKey(name: 'verdict')
  final String? verdict;

  @JsonKey(name: 'problem')
  final ProblemDto problemDto;
}
