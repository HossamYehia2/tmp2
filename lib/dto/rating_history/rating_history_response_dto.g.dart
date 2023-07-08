// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingHistoryResponseDto _$RatingHistoryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RatingHistoryResponseDto(
      contestId: json['contestId'] as int?,
      contestName: json['contestName'] as String?,
      handle: json['handle'] as String?,
      rank: json['rank'] as int?,
      oldRating: json['oldRating'] as int?,
      newRating: json['newRating'] as int?,
    );

Map<String, dynamic> _$RatingHistoryResponseDtoToJson(
        RatingHistoryResponseDto instance) =>
    <String, dynamic>{
      'contestId': instance.contestId,
      'contestName': instance.contestName,
      'handle': instance.handle,
      'rank': instance.rank,
      'oldRating': instance.oldRating,
      'newRating': instance.newRating,
    };
