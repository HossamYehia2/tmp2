import 'package:first_app/objects/ContestRecord.dart';

import 'dto/contest_list/contest_list_response_dto.dart';
import 'dto/hack_details/hack_details_dto.dart';
import 'dto/rating_history/rating_history_response_dto.dart';
import 'dto/submission_history/submission_history_response_dto.dart';
import 'dto/user_info/user_info_response_dto.dart';

// mazihang2022
String userName = '';// = "_hossamyehia_";

var isUserInfoResponseDtoLoaded = false;
UserInfoResponseDto userInfoResponseDto = UserInfoResponseDto();

var isRatingHistoryResponseListLoaded = false;
List<RatingHistoryResponseDto> ratingHistoryResponseList = <RatingHistoryResponseDto>[];

var isSubmissionHistoryResponseListLoaded = false;
List<SubmissionHistoryResponseDto> submissionHistoryResponseList = <SubmissionHistoryResponseDto>[];

///******************************************************************/

var isContestsListLoaded = false;
List<ContestRecordWidget> passedContestList = <ContestRecordWidget>[];

List<ContestRecordWidget> currentContestList = <ContestRecordWidget>[];

List<ContestRecordWidget> futureContestList = <ContestRecordWidget>[];

///******************************************************************/

List<HackDetailsDto> MySuccessfulHacksList = <HackDetailsDto>[];
List<HackDetailsDto> MyUnSuccessfulHacksList = <HackDetailsDto>[];

List<HackDetailsDto> AgainstSuccessfulHacksList = <HackDetailsDto>[];
List<HackDetailsDto> AgainstUnSuccessfulHacksList = <HackDetailsDto>[];