import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/screens/list_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 40),
            TextButton(
              child: const Text('Start', style: TextStyle(fontSize: 20),),
              onPressed: () {
                context.goNamed(ListScreen.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}