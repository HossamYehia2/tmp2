// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hack_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HackDto _$HackDtoFromJson(Map<String, dynamic> json) => HackDto(
      id: json['id'] as int,
      hackTime: json['creationTimeSeconds'] as int,
      hacker: PartyDto.fromJson(json['hacker'] as Map<String, dynamic>),
      defender: PartyDto.fromJson(json['defender'] as Map<String, dynamic>),
      verdict: json['verdict'] as String,
      problemDto: ProblemDto.fromJson(json['problem'] as Map<String, dynamic>),
      judgeProtocol: json['judgeProtocol'] == null
          ? null
          : JudgeProtocolDto.fromJson(
              json['judgeProtocol'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HackDtoToJson(HackDto instance) => <String, dynamic>{
      'id': instance.id,
      'creationTimeSeconds': instance.hackTime,
      'hacker': instance.hacker,
      'defender': instance.defender,
      'verdict': instance.verdict,
      'problem': instance.problemDto,
      'judgeProtocol': instance.judgeProtocol,
    };
