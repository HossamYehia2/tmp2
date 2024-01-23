import 'package:first_app/objects/HackRecord.dart';

import '../Utils/CustomPadding.dart';
import '../Utils/ListDisplay.dart';
import '../Utils/NavBar.dart';
import 'package:flutter/material.dart';

import '../Utils/SizeUtils.dart';
import '../Variables.dart';
import '../dto/hack_details/hack_details_dto.dart';
import '../objects/RatingHistoryRecord.dart';
import '../utils/Initializer.dart';
import '../utils/Utils.dart';

class HacksPage extends StatefulWidget {
  const HacksPage({Key? key}) : super(key: key);
  static const routeName = '/hacksPage';

  @override
  State<HacksPage> createState() => _HacksPageState();
}

class _HacksPageState extends State<HacksPage> {
  List<String> contestsList = [];
  String? dropdownValue;
  var mappedContestIds = {};
  Widget? hacksList;

  _HacksPageState() {
    prepareContestsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Hacks Page'),
        ),
        body: Center(
          child : Column(children: [
            DropdownButton<String>(
              value: dropdownValue,
              items: getItems(),
              hint: const Text("Choose a contest"),
              onChanged: (String? newValue) async {
                setState(() {
                  dropdownValue = newValue ?? "";
                  getHacksList().then((res) => setState(() {
                    hacksList = res;
                  }));
                });
              },
            ),
          CustomPadding().get(
              0,
              Utils().getHeight(0.03, context),
              0,
              Utils().getHeight(0.00, context), getNumbers()),
            Container(
              height: Utils().getHeight(0.4, context),
              width: Utils().getWidth(0.90, context),
              child: CustomPadding().get(
                  0,
                  Utils().getHeight(0.03, context),
                  0,
                  Utils().getHeight(0.00, context), hacksList),
            )
          ]),
        ));
  }

  Widget getNumbers() {

    return Container(
        height: Utils().getHeight(0.2, context),
        width: Utils().getWidth(0.90, context),
        decoration: getBoxDecoration(),
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Utils().concatenate(
                    'Number of successful hacks you did : ',
                    MySuccessfulHacksList.length.toString(),
                    Colors.black,
                    const Icon(Icons.people_alt_outlined),
                    context,
                    textSize: 12),
                Utils().concatenate(
                    'Number of un-successful hacks you did : ',
                    MyUnSuccessfulHacksList.length.toString(),
                    Colors.black,
                    const Icon(Icons.bar_chart),
                    context,
                    textSize: 12),
                Utils().concatenate(
                    'Number of successful hacks done against you : ',
                    AgainstSuccessfulHacksList.length.toString(),
                    Colors.black,
                    const Icon(Icons.people_alt_outlined),
                    context,
                    textSize: 12),
                Utils().concatenate(
                    'Number of un-successful hacks done against you : ',
                    AgainstUnSuccessfulHacksList.length.toString(),
                    Colors.black,
                    const Icon(Icons.bar_chart),
                    context,
                    textSize: 12),
              ],
            ));
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      border: Border.all(color: Colors.black38),
      boxShadow: const [
        BoxShadow(color: Colors.black, blurRadius: 4, offset: Offset(4, 8))
      ],
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    );
  }

  Future<Widget> getHacksList() async {
    if(dropdownValue == null) {
      List<Object> x = [];
      return ListDisplay(itemsList: x);
    }
    print(dropdownValue);
    await loadContestHacks(dropdownValue.toString());

    print(MySuccessfulHacksList.length);
    print(MyUnSuccessfulHacksList.length);
    print(AgainstSuccessfulHacksList.length);
    print(AgainstUnSuccessfulHacksList.length);


    List<Object> x = [];
    List<HackDetailsDto> tmp = [];

    tmp.addAll(MySuccessfulHacksList);
    tmp.addAll(MyUnSuccessfulHacksList);
    tmp.addAll(AgainstSuccessfulHacksList);
    tmp.addAll(AgainstUnSuccessfulHacksList);

    for (int i = 0; i < tmp.length; ++i) {
      var hack = tmp[i];
      x.add(HackRecordWidget(
          problemName: hack.problemDto.name,
          hacker: hack.hackerName,
          defender: hack.defenderName,
          verdict: hack.verdict
      ));
    }

    return ListDisplay(itemsList: x);
  }

  Widget getRatingHistory() {
    List<Object> ratingHistoryList = [];
    for (int i = 0; i < ratingHistoryResponseList.length; ++i) {
      var contest = ratingHistoryResponseList[i];
      ratingHistoryList.add(RatingHistoryRecordWidget(
        contestName: contest.contestName,
        rank: contest.rank,
        oldRating: contest.oldRating,
        newRating: contest.newRating,));
    }

    return ListDisplay(itemsList: ratingHistoryList);
  }

  /*************************************/
  // prepare data

  void prepareContestsData() {
    for (int i = 0; i < ratingHistoryResponseList.length; ++i) {
      var contest = ratingHistoryResponseList[i];
      var contestId = contest.contestId;
      var contestName = contest.contestName.toString();

      contestsList.add(contestName);
      mappedContestIds[contestName] = contestId;
    }

    contestsList = ['A', 'B', 'C', 'D'];
  }

  List<DropdownMenuItem<String>>? getItems() {
    return contestsList.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(fontSize: 15),
        ),
      );
    }).toList();
  }

  Future loadContestHacks(String contestName) async {
    if (contestName == "") {
      return;
    }

    var contestId = mappedContestIds[contestName];
    await Initializer().loadHacks(contestId);
  }
}
