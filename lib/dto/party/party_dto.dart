import 'package:first_app/dto/member/member_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'party_dto.g.dart';

@JsonSerializable()
class PartyDto {
  PartyDto(
      {
        required this.contestId,
        required this.members,
        required this.room,
      });

  factory PartyDto.fromJson(Map<String, dynamic> json) =>
      _$PartyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PartyDtoToJson(this);

  @JsonKey(name: 'contestId')
  final int contestId;

  @JsonKey(name: 'members')
  final List<MemberDto> members;

  @JsonKey(name: 'room')
  final int? room;
}
