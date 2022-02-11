import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/main.dart';
import 'package:flutter_go_router_demo/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
            const SizedBox(height: 40),
            TextButton(
                onPressed: () async {
                  loginInfo.isLoggedIn = true;
                  //context.goNamed(HomeScreen.name);
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool(prefsIsLoggedIn, true);
                },
                child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
