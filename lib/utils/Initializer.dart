import 'dart:io';

import 'package:first_app/dto/contest_list/contest_list_response_dto.dart';
import 'package:first_app/dto/hack/hack_dto.dart';
import 'package:first_app/dto/hack_details/hack_details_dto.dart';

import '../Utils/ApiLibrary.dart';
import '../Variables.dart';
import '../dto/rating_history/rating_history_response_dto.dart';
import '../dto/submission_history/submission_history_response_dto.dart';
import '../dto/user_info/user_info_response_dto.dart';

class Initializer {

  Future<void> startApp() async {
    await loadUserInfo();
    await loadRatingHistory();
  }

  Future<void> loadRemainingData() async {
    await loadContestList();
    // await loadHacks();
    await loadSubmissionHistory();
  }

  Future<void> loadUserInfo() async {
    var userInfoResponse = await sendGetUserInfoRequest();
    userInfoResponseDto = UserInfoResponseDto.fromJson(userInfoResponse[0]);
  }

  Future<void> loadRatingHistory() async {
    var ratingHistoryResponse = await sendGetRatingHistoryRequest();
    for (int i = 0; i < ratingHistoryResponse.length; ++i) {
      ratingHistoryResponseList
          .add(RatingHistoryResponseDto.fromJson(ratingHistoryResponse[i]));
    }
  }

  Future<void> loadContestList() async {
    var contestListResponse = await sendGetContestListRequest(false);
    var now = DateTime.now();

    for (int i = 0; i < contestListResponse.length; ++i) {
      var contest = ContestListResponseDto.fromJson(contestListResponse[i]);

      var startTime = DateTime.fromMillisecondsSinceEpoch(1000 * contest.startTime);
      var endTime = DateTime.fromMillisecondsSinceEpoch(1000 * (contest.startTime + contest.durationSeconds));
      if(endTime.isBefore(now) == true) {
        passedContestList.add(contest);
        // print("Passed : ${contest.id}");
      }
      else if(startTime.isBefore(now) == true && DateTime.now().isBefore(endTime) == true) {
        currentContestList.add(contest);
        // print("Current : ${contest.id}");
      }
      else {
        futureContestList.add(contest);
        // print("future : ${contest.id}");
      }
    }
  }

  Future<void> loadSubmissionHistory() async {
    var submissionHistoryResponse = await sendGetSubmissionHistoryRequest(1, 6);
    for (int i = 0; i < submissionHistoryResponse.length; ++i) {
      var submission = SubmissionHistoryResponseDto.fromJson(submissionHistoryResponse[i]);
      submission.solutionLink = "https://codeforces.com/contest/${submission.contestId}/submission/${submission.submissionId}";
      submissionHistoryResponseList.add(submission);
    }
  }

  Future<void> loadHacks() async {
    for (int i = 0; i < passedContestList.length ; ++i) {
      // Remove after testing
      // var id = 1213; // contestListResponseList[i].id
      var id = passedContestList[i].id;
      print(id);

      var contestHacksResponse = await sendGetContestHacksRequest(id);
      var contestHacksResponseSize = contestHacksResponse.length;
      for(int j = 0 ; j < contestHacksResponseSize ; ++j) {
        var hack = HackDto.fromJson(contestHacksResponse[j]);
        var hackerName = hack.hacker.members[0].handle.toLowerCase();
        // print("$hackerName\n");

        // All hacks (successful & un-successful)

        if(hackerName == userName.toLowerCase()) {
          // user make a new hack
          if(hack.verdict == "HACK_SUCCESSFUL") {
            MySuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
          }
          else if(hack.verdict == "HACK_UNSUCCESSFUL") {
            MyUnSuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
          }
        }
        if(hack.defender.members[0].handle == userName.toLowerCase()) {
          // hacked!!
          if(hack.verdict == "HACK_SUCCESSFUL") {
            AgainstSuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
          }
          else if(hack.verdict == "HACK_UNSUCCESSFUL") {
            AgainstUnSuccessfulHacksList.add(HackDetailsDto(hackId: hack.id, hackTime: hack.hackTime, hackerName: hackerName, verdict: hack.judgeProtocol?.verdict, problemDto: hack.problemDto));
          }
        }
      }
      sleep(const Duration(milliseconds: 100));

    }
    print("Done");
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
}