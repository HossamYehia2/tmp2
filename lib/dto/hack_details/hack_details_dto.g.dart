// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hack_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HackDetailsDto _$HackDetailsDtoFromJson(Map<String, dynamic> json) =>
    HackDetailsDto(
      hackId: json['hackId'] as int,
      hackTime: json['creationTimeSeconds'] as int,
      hackerName: json['hackerName'] as String,
      verdict: json['verdict'] as String?,
      problemDto: ProblemDto.fromJson(json['problem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HackDetailsDtoToJson(HackDetailsDto instance) =>
    <String, dynamic>{
      'hackId': instance.hackId,
      'creationTimeSeconds': instance.hackTime,
      'hackerName': instance.hackerName,
      'verdict': instance.verdict,
      'problem': instance.problemDto,
    };
