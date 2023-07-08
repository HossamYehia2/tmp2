import 'package:json_annotation/json_annotation.dart';

part 'judge_protocol_dto.g.dart';

@JsonSerializable()
class JudgeProtocolDto {
  JudgeProtocolDto(
      {
        required this.protocol,
        required this.manual,
        required this.verdict,
      });

  factory JudgeProtocolDto.fromJson(Map<String, dynamic> json) =>
      _$JudgeProtocolDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JudgeProtocolDtoToJson(this);

  @JsonKey(name: 'protocol')
  final String protocol;

  @JsonKey(name: 'manual')
  final String manual;

  @JsonKey(name: 'verdict')
  final String verdict;
}
