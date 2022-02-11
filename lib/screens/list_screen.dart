import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/screens/details_screen.dart';
import 'package:flutter_go_router_demo/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_go_router_demo/menu.dart';

class ListScreen extends StatelessWidget {
  static const String name = 'ListScreen';
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ListScreen.name),
        // leading: IconButton(
        //   onPressed: () {
        //     context.goNamed(HomeScreen.name);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios),
        // ),
      ),
      body: ListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.router),
            title: Text(itemsList[index].name),
            onTap: () {
              print('PRESSED INDEX: $index');
              //context.go('/${ListScreen.name}/${itemsList[index].id}');
              context.goNamed(
                  DetailsScreen.name,
                  params: {'id': itemsList[index].id.toString()},
              );
            },
          );
        },
      ),
    );
  }
}
