// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyDto _$PartyDtoFromJson(Map<String, dynamic> json) => PartyDto(
      contestId: json['contestId'] as int,
      members: (json['members'] as List<dynamic>)
          .map((e) => MemberDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      room: json['room'] as int?,
    );

Map<String, dynamic> _$PartyDtoToJson(PartyDto instance) => <String, dynamic>{
      'contestId': instance.contestId,
      'members': instance.members,
      'room': instance.room,
    };
