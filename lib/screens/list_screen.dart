import 'package:flutter/material.dart';
import 'package:flutter_go_router_demo/screens/details_screen.dart';
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
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
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
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                //context.goNamed(SecondSubScreen.name);
              },
              child: const Text('Go Second Sub Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
