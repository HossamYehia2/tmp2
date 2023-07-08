import 'package:json_annotation/json_annotation.dart';

part 'member_dto.g.dart';

@JsonSerializable()
class MemberDto {
  MemberDto(
      {
        required this.handle,
        required this.name,
      });

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MemberDtoToJson(this);

  @JsonKey(name: 'handle')
  final String handle;

  @JsonKey(name: 'name')
  final String? name;
}
