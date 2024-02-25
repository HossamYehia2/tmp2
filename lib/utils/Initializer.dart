import 'dart:io';

import 'package:first_app/dto/contest_list/contest_list_response_dto.dart';
import 'package:first_app/dto/hack/hack_dto.dart';
import 'package:first_app/dto/hack_details/hack_details_dto.dart';
import 'package:first_app/objects/ContestRecord.dart';

import '../Utils/ApiLibrary.dart';
import '../Variables.dart';
import '../dto/rating_history/rating_history_response_dto.dart';
import '../dto/submission_history/submission_history_response_dto.dart';
import '../dto/user_info/user_info_response_dto.dart';

class Initializer {

  Future<void> startApp() async {
    print("In startApp");
    await loadUserInfo();
    await loadRatingHistory();
  }

  Future<void> loadRemainingData() async {
    await loadContestList();
    await loadSubmissionHistory();
  }

  Future<void> loadUserInfo() async {
    if(isUserInfoResponseDtoLoaded == true)
    {
      return;
    }
    var userInfoResponse = await sendGetUserInfoRequest();
    userInfoResponseDto = UserInfoResponseDto.fromJson(userInfoResponse[0]);
    isUserInfoResponseDtoLoaded = true;
  }

  Future<void> loadRatingHistory() async {
    if(isRatingHistoryResponseListLoaded == true)
    {
      return;
    }
    var ratingHistoryResponse = await sendGetRatingHistoryRequest();
    for (int i = 0; i < ratingHistoryResponse.length; ++i) {
      ratingHistoryResponseList
          .add(RatingHistoryResponseDto.fromJson(ratingHistoryResponse[i]));
    }

    // Sort rating history in decreasing order
    ratingHistoryResponseList = ratingHistoryResponseList.reversed.toList();

    isRatingHistoryResponseListLoaded = true;
  }

  Future<void> loadContestList() async {
    // print("In loadContestList");
    if(isContestsListLoaded == true)
    {
      return;
    }
    var contestListResponse = await sendGetContestListRequest(false);
    var now = DateTime.now().toUtc();

    for (int i = 0; i < contestListResponse.length; ++i) {
      var contest = ContestListResponseDto.fromJson(contestListResponse[i]);
      if(contest.type != 'CF' && contest.type != 'ICPC') {
          continue;
      }

      var startTime = DateTime.fromMillisecondsSinceEpoch(1000 * contest.startTime);
      var endTime = DateTime.fromMillisecondsSinceEpoch(1000 * (contest.startTime + contest.durationSeconds));
      if(endTime.isBefore(now) == true) {
        passedContestList.add(ContestRecordWidget(id : contest.id, name: contest.name, durationSeconds: contest.durationSeconds, startTime: contest.startTime,));
        // print("Passed : ${contest.id}");
      }
      else if(startTime.isBefore(now) == true && DateTime.now().isBefore(endTime) == true) {
        currentContestList.add(ContestRecordWidget(id : contest.id, name: contest.name, durationSeconds: contest.durationSeconds, startTime: contest.startTime,));

        // print("Current : ${contest.id}");
      }
      else {
        futureContestList.add(ContestRecordWidget(id : contest.id, name: contest.name, durationSeconds: contest.durationSeconds, startTime: contest.startTime,));
        // print("future : ${contest.id}");
      }
    }

    // Sort upcoming contest in decreasing order
    futureContestList = futureContestList.reversed.toList();

    isContestsListLoaded = true;
    // print("isContestsListLoaded");
    // print(isContestsListLoaded);
  }

  Future<void> loadSubmissionHistory() async {
    if(isSubmissionHistoryResponseListLoaded == true)
    {
      return;
    }
    var submissionHistoryResponse = await sendGetSubmissionHistoryRequest(1, 6);
    for (int i = 0; i < submissionHistoryResponse.length; ++i) {
      var submission = SubmissionHistoryResponseDto.fromJson(submissionHistoryResponse[i]);
      submission.solutionLink = "https://codeforces.com/contest/${submission.contestId}/submission/${submission.submissionId}";
      submissionHistoryResponseList.add(submission);
    }

    isSubmissionHistoryResponseListLoaded = true;
  }

  Future<void> loadHacks(contestId) async {
    clearHacksLists();
    // contestId = "1622";
    // print("contest id : ");
    // print(contestId);

    var contestHacksResponse = await sendGetContestHacksRequest(contestId);
    var contestHacksResponseSize = contestHacksResponse.length;
    for(int j = 0 ; j < contestHacksResponseSize ; ++j) {
      var hack = HackDto.fromJson(contestHacksResponse[j]);
      var hackerName = hack.hacker.members[0].handle.toLowerCase();
      var defenderName = hack.defender.members[0].handle.toLowerCase();
      // print("$hackerName\n");

      // All hacks (successful & un-successful)
      if(hackerName == userName.toLowerCase()) {
        // user make a new hack
        if(hack.verdict == "HACK_SUCCESSFUL") {
          MySuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, defenderName: defenderName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
        }
        else if(hack.verdict == "HACK_UNSUCCESSFUL") {
          MyUnSuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, defenderName: defenderName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
        }
      }
      if(hack.defender.members[0].handle == userName.toLowerCase()) {
        // hacked!!
        if(hack.verdict == "HACK_SUCCESSFUL") {
          AgainstSuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, defenderName: defenderName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
        }
        else if(hack.verdict == "HACK_UNSUCCESSFUL") {
          AgainstUnSuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, defenderName: defenderName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
        }
      }
    }
  }

  /// ******************************************************/

  Future<List<dynamic>> sendGetUserInfoRequest() async {
    Map<String, dynamic> queryParams = {
      'handles': userName,
    };

    return await ApiLibrary()
        .sendGetRequest('codeforces.com', '/api/user.info', queryParams);
  }

  Future<List<dynamic>> sendGetRatingHistoryRequest() async {
    Map<String, dynamic> queryParams = {
      'handle': userName,
    };

    return await ApiLibrary()
        .sendGetRequest('codeforces.com', '/api/user.rating', queryParams);
  }

  Future<List<dynamic>> sendGetSubmissionHistoryRequest(startingIndex, submissionCount) async {
    Map<String, dynamic> queryParams = {
      'handle': userName,
      'from': startingIndex.toString(),
      'count': submissionCount.toString(),
    };

    return await ApiLibrary()
        .sendGetRequest('codeforces.com', '/api/user.status', queryParams);
  }

  Future<List<dynamic>> sendGetContestListRequest(isGym) async {
    Map<String, dynamic> queryParams = {
      'gym': isGym.toString(),
    };

    return await ApiLibrary()
        .sendGetRequest('codeforces.com', '/api/contest.list', queryParams);
  }

  Future<List<dynamic>> sendGetContestHacksRequest(contestId) async {
    Map<String, dynamic> queryParams = {
      'contestId': contestId.toString(),
    };

    return await ApiLibrary()
        .sendGetRequest('codeforces.com', '/api/contest.hacks', queryParams);
  }

  void clearHacksLists() {
    MySuccessfulHacksList.clear();
    MyUnSuccessfulHacksList.clear();
    AgainstSuccessfulHacksList.clear();
    AgainstUnSuccessfulHacksList.clear();
  }
}