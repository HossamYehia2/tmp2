import 'package:json_annotation/json_annotation.dart';

part 'user_info_response_dto.g.dart';

@JsonSerializable()
class UserInfoResponseDto {
  UserInfoResponseDto(
      {
        this.handle,
        this.firstName,
        this.lastName,
        this.country,
        this.city,
        this.organization,
        this.contribution,
        this.rank,
        this.maxRank,
        this.rating,
        this.maxRating,
        this.friendOf,
        this.avatarUrl,
        this.titlePhotoUrl,
      });

  factory UserInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseDtoToJson(this);

  @JsonKey(name: 'handle')
  final String? handle;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'organization')
  final String? organization;

  @JsonKey(name: 'contribution')
  final int? contribution;

  @JsonKey(name: 'rank')
  final String? rank;

  @JsonKey(name: 'maxRank')
  final String? maxRank;

  @JsonKey(name: 'rating')
  final int? rating;

  @JsonKey(name: 'maxRating')
  final int? maxRating;

  @JsonKey(name: 'friendOfCount')
  final int? friendOf;

  @JsonKey(name: 'avatar')
  final String? avatarUrl;

  @JsonKey(name: 'titlePhoto')
  final String? titlePhotoUrl;
}
