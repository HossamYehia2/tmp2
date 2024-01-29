import 'package:flutter/material.dart';
import 'package:first_app/objects/HackRecord.dart';
import '../Utils/ListDisplay.dart';
import '../Utils/NavBar.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(8),
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
            ),
            const SizedBox(height: 16),
            Container(
              decoration: getBoxDecoration(),
              padding: const EdgeInsets.all(16),
              child: getNumbers(),
            ),
            const SizedBox(height: 16),
            /*Flexible(
              child: Container(
                decoration: getBoxDecoration(),
                padding: const EdgeInsets.all(16),
                child: hacksList ?? const ListDisplay(itemsList: []),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget getNumbers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Utils().concatenate(
          'Number of successful hacks you did : ',
          MySuccessfulHacksList.length.toString(),
          Colors.black,
          const Icon(Icons.people_alt_outlined),
          context,
          textSize: 12,
        ),
        Utils().concatenate(
          'Number of un-successful hacks you did : ',
          MyUnSuccessfulHacksList.length.toString(),
          Colors.black,
          const Icon(Icons.bar_chart),
          context,
          textSize: 12,
        ),
        Utils().concatenate(
          'Number of successful hacks done against you : ',
          AgainstSuccessfulHacksList.length.toString(),
          Colors.black,
          const Icon(Icons.people_alt_outlined),
          context,
          textSize: 12,
        ),
        Utils().concatenate(
          'Number of un-successful hacks done against you : ',
          AgainstUnSuccessfulHacksList.length.toString(),
          Colors.black,
          const Icon(Icons.bar_chart),
          context,
          textSize: 12,
        ),
      ],
    );
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black, blurRadius: 4, offset: Offset(4, 8)),
      ],
    );
  }

  Future<Widget> getHacksList() async {
    if (dropdownValue == null) {
      return const ListDisplay(itemsList: []);
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
        verdict: hack.verdict,
      ));
    }

    return ListDisplay(itemsList: x);
  }

  Widget getRatingHistory() {
    List<Object> ratingHistoryList = [];
    for (int i = 0; i < ratingHistoryResponseList.length; ++i) {
      var contest = ratingHistoryResponseList[i];
      ratingHistoryList.add(RatingHistoryRecordWidget(
        id: contest.contestId,
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

    // contestsList = ['A', 'B', 'C', 'D'];
  }

  List<DropdownMenuItem<String>>? getItems() {
    return contestsList.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        alignment: Alignment.center,
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
