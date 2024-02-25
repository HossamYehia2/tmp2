import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:telecom_app/HelperWidgets/banner_ad_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/NavBar.dart';

class ContactUsScreen extends StatelessWidget {
  final String email = 'yehiaapps@gmail.com';

  final String appBarText;
  final String emailType;

  ContactUsScreen({required this.appBarText, required this.emailType});

  @override
  Widget build(BuildContext context) {
    double screenHeightRatio = MediaQuery.of(context).size.height * 0.02;
    double buttonWidthRatio = MediaQuery.of(context).size.width * 0.65;
    double buttonHeightRatio = MediaQuery.of(context).size.height * 0.05;

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: FittedBox(fit: BoxFit.contain, child: Text(appBarText, textAlign: TextAlign.center)),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeightRatio * 1.5),
            const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Contact us on email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: screenHeightRatio),
            GestureDetector(
              onTap: () {
                _copyToClipboard(context);
              },
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  email,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeightRatio * 1.5),
            SizedBox(
              width: buttonWidthRatio,
              height: buttonHeightRatio,
              child: ElevatedButton(
                onPressed: () {
                  final Uri url = Uri.parse('mailto:$email?subject=$emailType');
                  launchUrl(url);
                },
                child: const FittedBox(fit: BoxFit.contain, child: Text('Send an email', style: TextStyle(fontSize: 20),)),
              ),
            ),
            SizedBox(height: screenHeightRatio * 1.5),
            // GetBannerAdContainer(),
          ],
        ),
      ),
    );
  }

  _copyToClipboard(context) {
    Clipboard.setData(ClipboardData(text: email));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email copied to clipboard'),
      ),
    );
  }
}