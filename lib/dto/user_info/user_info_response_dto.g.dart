// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponseDto _$UserInfoResponseDtoFromJson(Map<String, dynamic> json) =>
    UserInfoResponseDto(
      handle: json['handle'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      organization: json['organization'] as String?,
      contribution: json['contribution'] as int?,
      rank: json['rank'] as String?,
      maxRank: json['maxRank'] as String?,
      rating: json['rating'] as int?,
      maxRating: json['maxRating'] as int?,
      friendOf: json['friendOfCount'] as int?,
      avatarUrl: json['avatar'] as String?,
      titlePhotoUrl: json['titlePhoto'] as String?,
    );

Map<String, dynamic> _$UserInfoResponseDtoToJson(
        UserInfoResponseDto instance) =>
    <String, dynamic>{
      'handle': instance.handle,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'country': instance.country,
      'city': instance.city,
      'organization': instance.organization,
      'contribution': instance.contribution,
      'rank': instance.rank,
      'maxRank': instance.maxRank,
      'rating': instance.rating,
      'maxRating': instance.maxRating,
      'friendOfCount': instance.friendOf,
      'avatar': instance.avatarUrl,
      'titlePhoto': instance.titlePhotoUrl,
    };
