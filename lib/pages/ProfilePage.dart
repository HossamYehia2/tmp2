import '../Utils/ApiLibrary.dart';
import '../Utils/CustomPadding.dart';
import '../Utils/NavBar.dart';
import '../Utils/SizeUtils.dart';
import '../Variables.dart';
import '../dto/rating_history/rating_history_response_dto.dart';
import '../dto/user_info/user_info_response_dto.dart';
import 'package:flutter/material.dart';

import '../utils/Initializer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: const ProfilePageWidget());
  }
}

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  bool _isLoading = true;

  late Color handleColor;
  late Color maxRankColor;
  late Widget loading = getLoading();
  Widget profileData = Container();

  _ProfilePageWidgetState() {
    buildScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _isLoading ? loading : profileData,
        ],
      ),
    );
  }

  /****************************************************/

  Future<Image> downloadProfilePhoto(url) async {
    return Image.network(url);
  }

  /****************************************************/

  Future<void> buildScreen() async {
    try {

      await Initializer().startApp();
      Initializer().loadRemainingData();

      var profileImage = await downloadProfilePhoto(
          userInfoResponseDto.titlePhotoUrl.toString());

      updateLocalVariables();

      setState(() {
        _isLoading = false;
        profileData = buildProfileData(profileImage.image);
      });
    } catch (ex) {
      ApiLibrary().handleEX(ex, context);
    }
  }

  Widget buildProfileData(image) {
    return Column(
      children: <Widget>[
        getProfilePhoto(
            image, userInfoResponseDto.firstName, userInfoResponseDto.lastName),
        getProfileInfoText(),
        getDetails(),
        getRecordText(),
        getNumbers(),
      ],
    );
  }

  void handleNullName() {
    if(userInfoResponseDto.firstName == null || userInfoResponseDto.lastName == null) {
      userInfoResponseDto.firstName = userInfoResponseDto.handle;
      userInfoResponseDto.lastName = "";
    }
  }

  void updateLocalVariables() {
    handleColor = setShadowColor(userInfoResponseDto.rank?.toLowerCase());
    maxRankColor = setShadowColor(userInfoResponseDto.maxRank?.toLowerCase());

    handleNullName();
  }

  /****************************************************/

  Widget getLoading() {
    return CustomPadding()
        .get(0, getWidth(0.75), 0, 0, const CircularProgressIndicator());
  }

  Widget getProfilePhoto(image, firstName, lastName) {
    return CustomPadding().get(
      0,
      getHeight(0.02),
      0,
      0,
      Container(
        height: getHeight(0.25),
        width: getWidth(0.90),
        decoration: getBoxDecoration(),
        child: Column(
          children: <Widget>[
                CustomPadding().get(0, getHeight(0.01), 0, getHeight(0.01), CircleAvatar(
                  backgroundColor: handleColor.withOpacity(0.7),
                  radius: getWidth(0.19),
                  child: CircleAvatar(
                    radius: getWidth(0.185),
                    backgroundImage: image,
                  ),
              )),
            Text("  $firstName $lastName", style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget getDetails() {
    return Container(
      height: getHeight(0.32),
      width: getWidth(0.90),
      decoration: getBoxDecoration(),
      child: CustomPadding().get(
        0,
        getHeight(0.01),
        0,
        0,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            concatenate('Handle: ', userInfoResponseDto.handle, handleColor, const Icon(Icons.bolt_outlined, color: Colors.orange)),
            concatenate(
                'Contribution: ', userInfoResponseDto.contribution.toString(), Colors.black, Image.asset("images/3.png", width: getWidth(0.055), height: getHeight(0.03), fit: BoxFit.fill)),
            concatenate('Lives in: ',
                "${userInfoResponseDto.city}, ${userInfoResponseDto.country}", Colors.black, const Icon(Icons.home, color: Colors.purple,)),
            concatenate(
                'Current Rating: ', userInfoResponseDto.rating.toString(), Colors.black, const Icon(Icons.calculate, color: Colors.purple,)),
            concatenate('Current Rank: ', userInfoResponseDto.rank.toString(), handleColor, Icon(Icons.person_outline, color: handleColor,)),
            concatenate(
                'Maximum Rating: ', userInfoResponseDto.maxRating.toString(), Colors.black, Image.asset("images/1.jpg", width: getWidth(0.06), height: getHeight(0.03), fit: BoxFit.fill)),
            concatenate('Maximum Rank: ', userInfoResponseDto.maxRank.toString(), maxRankColor, Image.asset("images/1.jpg", width: getWidth(0.06), height: getHeight(0.03), fit: BoxFit.fill)),
          ],
        ),
      ),
    );
  }

  Widget getNumbers() {
    return Container(
        height: getHeight(0.1),
        width: getWidth(0.90),
        decoration: getBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            concatenate('Number of friends followed you : ',
                userInfoResponseDto.friendOf.toString(), Colors.black, const Icon(Icons.people_alt_outlined)),
            concatenate('Number of official practiced contests : ',
                ratingHistoryResponseList.length.toString(), Colors.black, const Icon(Icons.bar_chart)),
          ],
        ));
  }

  Color setShadowColor(rank) {
    switch(rank) {
      case "newbie": {
        return Colors.grey.shade700;
      }
      case "pupil": {
        return Colors.green.shade700;
      }
      case "specialist": {
        return Colors.lightBlue;
      }
      case "expert": {
        return Colors.blue.shade900;
      }
      case "candidate master": {
        return Colors.purple.shade700;
      }
      case "master": {
        return Colors.deepOrangeAccent.shade700;
      }
      case "international master": {
        return Colors.deepOrangeAccent.shade700;
      }
      case "grandmaster": {
        return Colors.red.shade700;
      }
      case "international grandmaster": {
        return Colors.red.shade700;
      }
      case "legendary grandmaster": {
        return Colors.red;
      }
      default: {
        return Colors.brown;
      }
    }
  }

  /****************************************************/

  Widget getProfileInfoText() {
    return CustomPadding().get(
      getWidth(0.08),
      getHeight(0.03),
      0,
      getHeight(0.01),
      const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Profile Info', style: TextStyle(fontWeight: FontWeight.bold)
          )),
    );
  }

  Widget getRecordText() {
    return CustomPadding().get(
      getWidth(0.08),
      getHeight(0.03),
      0,
      getHeight(0.01),
      const Align(alignment: Alignment.topLeft, child: Text('Records', style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  /****************************************************/

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      border: Border.all(color: Colors.black38),
      boxShadow: [
        BoxShadow(color: handleColor, blurRadius: 4, offset: const Offset(4, 8))
      ],
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    );
  }

  Widget concatenate(firstString, secondString, textColor, icon) {
    return CustomPadding().get(
      getWidth(0.01),
      getHeight(0.01),
      0,
      0,
      Row(
        children: [
          icon,
          CustomPadding().get(getWidth(0.02), 0, 0, 0, Text("$firstString")),
          Text(" $secondString", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  double getHeight(ratio) {
    return SizeUtils().getHeightRatio(context, ratio);
  }

  double getWidth(ratio) {
    return SizeUtils().getWidthRatio(context, ratio);
  }
}
