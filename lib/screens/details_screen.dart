import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/main.dart';
import 'package:flutter_go_router_demo/menu.dart';
import 'package:flutter_go_router_demo/screens/other_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class DetailsScreen extends StatelessWidget {
  static const String name = 'DetailsScreen';

  final MyItem myItem;
  const DetailsScreen({
    Key? key,
    required this.myItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myItem.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(myItem.details),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                context.goNamed(OtherScreen.name);
              },
              child: const Text('Go Deeper'),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool(prefsIsLoggedIn, false);
                loginInfo.isLoggedIn = false;
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
