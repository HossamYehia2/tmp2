import 'package:json_annotation/json_annotation.dart';

part 'user_info_request_dto.g.dart';

@JsonSerializable()
class UserInfoRequestDto {
  UserInfoRequestDto(
      {required this.handle,});

  factory UserInfoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoRequestDtoToJson(this);

  @JsonKey(name: 'handle')
  final String handle;
}
