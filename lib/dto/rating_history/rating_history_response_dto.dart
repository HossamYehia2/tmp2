import 'package:json_annotation/json_annotation.dart';

part 'rating_history_response_dto.g.dart';

@JsonSerializable()
class RatingHistoryResponseDto {
  RatingHistoryResponseDto(
      {
        this.contestId,
        this.contestName,
        this.handle,
        this.rank,
        this.oldRating,
        this.newRating,
      });

  factory RatingHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RatingHistoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RatingHistoryResponseDtoToJson(this);

  @JsonKey(name: 'contestId')
  final int? contestId;

  @JsonKey(name: 'contestName')
  final String? contestName;

  @JsonKey(name: 'handle')
  final String? handle;

  @JsonKey(name: 'rank')
  final int? rank;

  @JsonKey(name: 'oldRating')
  final int? oldRating;

  @JsonKey(name: 'newRating')
  final int? newRating;
}
