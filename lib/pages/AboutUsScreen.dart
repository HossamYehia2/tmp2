import 'package:flutter/material.dart';
// import 'package:telecom_app/HelperWidgets/banner_ad_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../Utils/NavBar.dart';


class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double edgeInsetsWidth = screenWidth * 0.05;
    double edgeInsetsHeight = screenHeight * 0.03;

    double screenHeightRatio = MediaQuery.of(context).size.height * 0.01;

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const FittedBox(fit: BoxFit.contain, child: Text('About Us', textAlign: TextAlign.center)),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(edgeInsetsWidth, edgeInsetsHeight, edgeInsetsWidth, 0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Welcome to the Codeforces Hub App! Our app is designed to help competitive programmers like you keep track of Codeforces contests, see detailed schedules, and never miss a competition.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeightRatio),
              AutoSizeText(
                'Features:',
                style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 1,
              ),
              AutoSizeText(
                'Contest Times: Get the start and end times for each contest.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                'Duration Details: Know exactly how long each contest will last.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                'Hacks and Insights: Access tips and tricks to improve your strategy.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                'Rating Tracker: Monitor your progress with updates on your user rating after each contest.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeightRatio),
              AutoSizeText(
                'Our Goal:',
                style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 1,
              ),
              AutoSizeText(
                'We aim to make competitive programming more accessible and enjoyable. With our app, you can easily plan for contests, improve your skills, and track your growth in the competitive coding community.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeightRatio),
              AutoSizeText(
                'Join our community of coders and take your competitive programming to the next level with our Codeforces Hub App.',
                style: TextStyle(fontSize: screenHeight * 0.02, fontFamily: 'Cairo'),
                minFontSize: 10,
                stepGranularity: 1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeightRatio),
              const Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Hossam Yehia',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: screenHeightRatio),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterSocialButton(
                      onTap: () {
                        final Uri _url = Uri.parse('mailto:yehiaapps@gmail.com');
                        launchUrl(_url);
                      },
                      mini: true,
                      buttonType: ButtonType.google,
                    ),
                    FlutterSocialButton(
                      onTap: () {
                        final Uri _url = Uri.parse('https://www.linkedin.com/in/hossamyehia/');
                        launchUrl(_url);
                      },
                      mini: true,
                      buttonType: ButtonType.linkedin,
                    ),
                  ],
                ),
              ),
              // GetBannerAdContainer(),
            ],
          ),
        ),
      ),
    );
  }
}