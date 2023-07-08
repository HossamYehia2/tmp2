import 'dto/contest_list/contest_list_response_dto.dart';
import 'dto/hack_details/hack_details_dto.dart';
import 'dto/rating_history/rating_history_response_dto.dart';
import 'dto/submission_history/submission_history_response_dto.dart';
import 'dto/user_info/user_info_response_dto.dart';

// mazihang2022
String userName = "";


UserInfoResponseDto userInfoResponseDto = UserInfoResponseDto();

List<RatingHistoryResponseDto> ratingHistoryResponseList = <RatingHistoryResponseDto>[];

List<SubmissionHistoryResponseDto> submissionHistoryResponseList = <SubmissionHistoryResponseDto>[];

///******************************************************************/


List<ContestListResponseDto> passedContestList = <ContestListResponseDto>[];

List<ContestListResponseDto> currentContestList = <ContestListResponseDto>[];

List<ContestListResponseDto> futureContestList = <ContestListResponseDto>[];

///******************************************************************/

List<HackDetailsDto> MySuccessfulHacksList = <HackDetailsDto>[];
List<HackDetailsDto> MyUnSuccessfulHacksList = <HackDetailsDto>[];

List<HackDetailsDto> AgainstSuccessfulHacksList = <HackDetailsDto>[];
List<HackDetailsDto> AgainstUnSuccessfulHacksList = <HackDetailsDto>[];