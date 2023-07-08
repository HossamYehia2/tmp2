import 'package:json_annotation/json_annotation.dart';

part 'rating_history_request_dto.g.dart';

@JsonSerializable()
class RatingHistoryRequestDto {
  RatingHistoryRequestDto(
      {required this.handle,});

  factory RatingHistoryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RatingHistoryRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RatingHistoryRequestDtoToJson(this);

  @JsonKey(name: 'handle')
  final String handle;
}
