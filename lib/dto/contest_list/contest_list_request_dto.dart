import 'package:json_annotation/json_annotation.dart';

part 'contest_list_request_dto.g.dart';

@JsonSerializable()
class ContestListRequestDto {
  ContestListRequestDto(
      {
        required this.gym,
      });

  factory ContestListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ContestListRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ContestListRequestDtoToJson(this);

  @JsonKey(name: 'gym')
  final bool gym;
}
