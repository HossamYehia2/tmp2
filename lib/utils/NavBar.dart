// ignore_for_file: avoid_returning_null_for_void

import '../pages/ContestsPage.dart';
import 'package:flutter/material.dart';

import '../pages/HacksPage.dart';
import '../pages/ProfilePage.dart';
import '../pages/RatingHistory.dart';

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
                      image: NetworkImage(
                          'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'))),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.accessibility),
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
              leading: const Icon(Icons.accessibility),
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
              leading: const Icon(Icons.accessibility),
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
              leading: const Icon(Icons.accessibility),
              title: const Text('Hacks page'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HacksPage()),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
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
