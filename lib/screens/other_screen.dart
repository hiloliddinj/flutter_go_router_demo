import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class OtherScreen extends StatelessWidget {
  static const String name = 'OtherScreen';

  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(OtherScreen.name),
        leading: IconButton(
          onPressed: () {
            context.goNamed(HomeScreen.name);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Center(
        child: Text(OtherScreen.name),
      ),
    );
  }
}
