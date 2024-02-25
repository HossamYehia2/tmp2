// ignore_for_file: avoid_returning_null_for_void
import 'dart:io';
import '../pages/AboutUsScreen.dart';
import '../pages/ContactUsScreen.dart';
import '../pages/ContestsPage.dart';
import 'package:flutter/material.dart';

import '../pages/HacksPage.dart';
import '../pages/ProfilePage.dart';
import '../pages/RatingHistory.dart';
// import 'package:in_app_review/in_app_review.dart';
// import 'package:flutter_share/flutter_share.dart';

/*
// update data here
Future<void> showRateApp(context)
async {
  final InAppReview inAppReview = InAppReview.instance;
  if (await inAppReview.isAvailable()) {
    inAppReview.openStoreListing(appStoreId: 'yehiaapps.telecom_app');
  }
}

Future<void> shareApp() async {
  await FlutterShare.share(
      title: 'Check out عرفني شكرا - اكواد شبكات app!',
      text: 'استمتع بتجربة مميزة مع تطبيق "عرفني شكرا - اكواد شبكات". ساعد أصدقائك وأحبائك على اكتشاف أكواد شبكات الهواتف والاستمتاع بالمزايا الرائعة. قم بمشاركة التطبيق الآن!',
      linkUrl: 'https://play.google.com/store/apps/details?id=yehiaapps.telecom_app');
}
*/

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/codeforces.jpg"),
                ),
              ),
              child: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Home page'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                ),
              },
            ),
            ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Contests'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContestsPage()),
                ),
              },
            ),
            ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Rating history'),
              onTap: () => {
                // send request, get response
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RatingHistory()),
                ),
              },
            ),
            ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Hacks page'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HacksPage()),
                ),
              },
            ),
            /*ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Rate app'),
              onTap: () {
                Navigator.pop(context);
                showRateApp(context);
              },
            ),*/
            /*ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Share app'),
              onTap: () {
                Navigator.pop(context);
                shareApp();
              },
            ),*/
            ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('Contact us'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen(appBarText: 'Contact Us', emailType: 'Contact Us'))),
              },
            ),
            ListTile(
              // leading: const Icon(Icons.accessibility),
              title: const Text('About us'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen())),
              },
            ),
            ListTile(
              // leading: const Icon(Icons.info),
              title: const Text('Back'),
              onTap: () => {
                for(int i = 0 ; i < 3 ; ++i)
                  {
                    if(Navigator.canPop(context))
                      {
                        Navigator.pop(context),
                      }
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
