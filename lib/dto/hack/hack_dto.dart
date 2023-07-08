import 'package:first_app/dto/party/party_dto.dart';
import 'package:first_app/dto/problem/problem_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../judge_protocol/judge_protocol_dto.dart';

part 'hack_dto.g.dart';

@JsonSerializable()
class HackDto {
  HackDto(
      {
        required this.id,
        required this.hackTime,
        required this.hacker,
        required this.defender,
        required this.verdict,
        required this.problemDto,
        required this.judgeProtocol,
      });

  factory HackDto.fromJson(Map<String, dynamic> json) =>
      _$HackDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HackDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'creationTimeSeconds')
  final int hackTime;

  @JsonKey(name: 'hacker')
  final PartyDto hacker;

  @JsonKey(name: 'defender')
  final PartyDto defender;

  @JsonKey(name: 'verdict')
  final String verdict;

  @JsonKey(name: 'problem')
  final ProblemDto problemDto;

  @JsonKey(name: 'judgeProtocol')
  final JudgeProtocolDto? judgeProtocol;
}
