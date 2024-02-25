import 'package:flutter/material.dart';
import 'dart:async';
import 'package:first_app/objects/HackRecord.dart';
import '../Utils/ListDisplay.dart';
import '../Utils/NavBar.dart';
import '../Variables.dart';
import '../dto/hack_details/hack_details_dto.dart';
import '../utils/Initializer.dart';
import 'package:url_launcher/url_launcher.dart';



class HacksPage extends StatefulWidget {
  const HacksPage({Key? key}) : super(key: key);
  static const routeName = '/hacksPage';

  @override
  _HacksPageState createState() => _HacksPageState();
}

class _HacksPageState extends State<HacksPage> {
  List<String> contestsList = [];
  String? dropdownValue;
  var mappedContestIds = {};
  bool isLoading = false;
  Widget? hacksList;
  bool showLink = false;

  @override
  void initState() {
    super.initState();
    prepareContestsData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var verticalPadding = screenSize.height * 0.09;

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Hacks Page'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                items: contestsList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value, textAlign: TextAlign.center,)),
                  );
                }).toList(),
                hint: const Text("Choose a contest", textAlign: TextAlign.center,),
                onChanged: (String? newValue) {
                  setState(() {
                    showLink = newValue != null;
                    dropdownValue = newValue ?? "";
                  });
                  getHacksList().then((res) => setState(() {
                    hacksList = res;
                  }));
                },
                alignment: Alignment.center,
                isExpanded: true,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? LoadingBars()
                  : Column(
                mainAxisSize: MainAxisSize.min, // To prevent the Column from taking all available space.
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (showLink) getNumbers()
                  else Center(child: Text('Please select a contest to see your hacks.')),
                  SizedBox(height: verticalPadding),
                  if (showLink)
                    Center( // Center the button
                      child: ElevatedButton(
                        onPressed: () {
                          var url = 'https://codeforces.com/contest/${mappedContestIds[dropdownValue!]}';
                          Uri uri = Uri.parse(url);
                          launchUrl(uri);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // Button color
                          onPrimary: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text('Open Codeforces Contest'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }


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


  Future<Widget> getHacksList() async {


    // Placeholder for your getHacksList logic
    // Simulate a network request with a delay


    if (dropdownValue == null) {
      return const ListDisplay(itemsList: []);
    }

    setState(() {
      isLoading = true; // Start loading
    });

    // print(dropdownValue);
    await loadContestHacks(dropdownValue.toString());

    // print(MySuccessfulHacksList.length);
    // print(MyUnSuccessfulHacksList.length);
    // print(AgainstSuccessfulHacksList.length);
    // print(AgainstUnSuccessfulHacksList.length);

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

    setState(() {
      isLoading = false; // Stop loading after data is fetched
    });

    return ListDisplay(itemsList: x);
  }

  Future loadContestHacks(String contestName) async {
    if (contestName == "") {
      return;
    }

    var contestId = mappedContestIds[contestName];
    await Initializer().loadHacks(contestId);
  }

  Widget getNumbers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Replace this with your actual logic
        Text('Successful hacks you did: ${MySuccessfulHacksList.length}'),
        Text('Unsuccessful hacks you did: ${MyUnSuccessfulHacksList.length}'),
        Text('Successful hacks done against you: ${AgainstSuccessfulHacksList.length}'),
        Text('unsuccessful hacks done against you: ${AgainstUnSuccessfulHacksList.length}'),
      ],
    );
  }

}

class LoadingBars extends StatefulWidget {
  @override
  _LoadingBarsState createState() => _LoadingBarsState();
}

class _LoadingBarsState extends State<LoadingBars> with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  final int _barsCount = 3;
  final Duration _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(_barsCount, (index) {
      return AnimationController(
        vsync: this,
        duration: _animationDuration,
      )..repeat(reverse: true);
    });

    // Start each bar's animation after a delay
    for (int i = 0; i < _barsCount; i++) {
      Timer(Duration(milliseconds: i * 100), () {
        _animationControllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_barsCount, (index) {
        return ScaleTransition(
          scale: Tween(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(
              parent: _animationControllers[index],
              curve: Curves.easeInOut,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              width: 10,
              height: 30,
              color: (index == 0 ? Colors.yellow : (index == 1 ? Colors.blue : Colors.red)),
            ),
          ),
        );
      }),
    );
  }
}


